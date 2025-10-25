(define prompt?
   (let [(args (current-command-line-arguments))] 
     (cond
       [(= (vector-length args) 0) #t]
       [(string=? (vector-ref args 0) "-b") #f]
       [(string=? (vector-ref args 0) "--batch") #f]
       [else #t])))
         
(define (to-token line)
    (string-split line))

(define (get-history token history)
    (define n-str (substring token 1))
    (define n (string->number n-str))
    (if (or (= n 0) (> n (length history)))
        (begin 
        (displayln "Error: Invalid access to history") (void))
    (list-ref history (- (length history) n))))
    
(define (set-history tokens history)
    (define-values (result remaining) (eval-expression tokens history))
    (if (not (null? remaining))
        (begin 
        (displayln "Error: Invalid expression, unmatched tokens")
        (values (void) history))
    (values result (cons result history))))

(define (eval-expression tokens history)
    (if (null? tokens)
        (displayln "Error: No expression")
        (let ([curr-token (car tokens)]
            [rest (cdr tokens)])
        (cond
            [(char-numeric? (string-ref curr-token 0)) ; numeric operand
            (values (string->number curr-token) rest)]
          
            [(char=? (string-ref curr-token 0) #\$) ; history reference
            (values (get-history curr-token history) rest)]
          
            [(member curr-token '("+" "-" "*" "/")) ; operator
                (if (string=? curr-token "-")
                (let-values ([(val1 rest0) (eval-expression rest history)])
                    (values (- val1) rest0))
                (let-values ([(val1 rest1) (eval-expression rest history)])
                (let-values ([(val2 rest2) (eval-expression rest1 history)])
                    (cond
                        [(string=? curr-token "+") (values (+ val1 val2) rest2)]
                        [(string=? curr-token "*") (values (* val1 val2) rest2)]
                        [(string=? curr-token "/")
                        (if (= val2 0)
                            (error "Error: Illegal division by 0")
                            (values (/ val1 val2) rest2))]))))]
          [else (displayln "Error: Invalid input token")]))))

(define (main-loop history)
    (when prompt? (display "Enter your prefix expression or 'quit' to exit: "))
    (let ([input (read-line)])
        (cond
            [(string=? input "quit") (void)]
            [else
                (define tokens (to-token input))
                (define-values (result new-history) (set-history tokens history))
                (define id (+ 1 (length history)))
                (display id)
                (display ": ")
                (display (real->double-flonum result))
                (newline)
                (main-loop new-history)])))
                
(main-loop '())
