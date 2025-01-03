(defun iterative-shell-sort (lst)
  (let ((working-list (copy-list lst))
        (gap (floor (/ (length lst) 2))))
    (loop while (>= gap 1) do
          (loop for i from gap below (length working-list) do
                (let ((tmp (nth i working-list))
                      (j i))
                  (loop while (and (>= (- j gap) 0) (> (nth (- j gap) working-list) tmp)) do
                        (setf (nth j working-list) (nth (- j gap) working-list))
                        (setf j (- j gap)))
                  (setf (nth j working-list) tmp)))
          (setf gap (floor (/ gap 2))))
    working-list))

(defun run-iterative-shell-sort-tests ()
  (format t "Start testing iterative-shell-sort function~%")
  (verify-iterative-shell-sort "Test 1" '(100 20 0 50 80 10 30) '(0 10 20 30 50 80 100))
  (verify-iterative-shell-sort "Test 2" '(3 3 3 3 3) '(3 3 3 3 3)) 
  (verify-iterative-shell-sort "Test 3" '(5 -1 0 -5 10 -10) '(-10 -5 -1 0 5 10))
  (verify-iterative-shell-sort "Test 4" '(11 2 5 3 8) '(2 3 5 8 11)) 
  (verify-iterative-shell-sort "Test 5" '(99 1 9 89 19 29) '(1 9 19 29 89 99)) 
  (verify-iterative-shell-sort "Test 6" '(100000 -100000 500 0 -500) '(-100000 -500 0 500 100000)) 
  (format t "Testing completed~%"))