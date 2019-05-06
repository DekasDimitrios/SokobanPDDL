(define (domain SOKOBAN)

    (:predicates
                (worker ?x)                     ;Worker named X
                (crate ?x)                      ;Crate named X
                (leftOf ?x ?y)                  ;Location X is to the left of location Y
                (below ?x ?y)                   ;Location X is below location Y
                (at ?x ?y)                      ;Object X is at location Y
                (clear ?x)                      ;X is a clear location that an object can move to
    )

    (:action moveLeft                           ;Moves a worker leftwards
        :parameters (?worker ?x ?y)
        :precondition (and
                (worker ?worker)                ;Object worker must be a Worker
                (at ?worker ?x)                 ;Object worker must be at location X
                (leftOf ?y ?x)                  ;Destination Y must be to the left of the starting location X
                (clear ?y))                     ;Destination Y must be empty, worker can move freely
        :effect (and
                (at ?worker ?y)                 ;Object worker moves to location Y
                (clear ?x)                      ;There is no object in location X anymore
                (not (at ?worker ?x))           ;Object worker leaves location X
                (not (clear ?y)))               ;There is an object moved to location Y
    )
    
    (:action moveRight                          ;Moves a worker rightwards
        :parameters (?worker ?x ?y)
        :precondition (and
                (worker ?worker)                ;Object worker must be a Worker
                (at ?worker ?x)                 ;Object worker must be at location X
                (leftOf ?x ?y)                  ;Destination Y must be to the right of the starting location X
                (clear ?y))                     ;Destination Y must be empty, worker can move freely
        :effect (and
                (at ?worker ?y)                 ;Object worker moves to location Y
                (clear ?x)                      ;There is no object inr location X anymore
                (not (at ?worker ?x))           ;Object worker leaves location X
                (not (clear ?y)))               ;There is an object moved to location Y
    )

    (:action moveUp                             ;Moves a worker upwards
        :parameters (?worker ?x ?y)
        :precondition (and
                (worker ?worker)                ;Object worker must be a Worker
                (at ?worker ?x)                 ;Object worker must be at location X
                (below ?x ?y)                   ;Destination Y must be above the starting location X
                (clear ?y))                     ;Destination Y must be empty, worker can move freely
        :effect (and
                (at ?worker ?y)                 ;Object worker moves to location Y
                (clear ?x)                      ;There is no object in location X anymore
                (not (at ?worker ?x))           ;Object worker leaves location X
                (not (clear ?y)))               ;There is an object moved to location Y
    )
    
    (:action moveDown                           ;Moves a worker downwards
        :parameters (?worker ?x ?y)
        :precondition (and
                (worker ?worker)                ;Object worker must be a Worker
                (at ?worker ?x)                 ;Object worker must be at location X
                (below ?y ?x)                   ;Destination Y must be below the starting location X
                (clear ?y))                     ;Destination Y must be empty, worker can move freely
        :effect (and
                (at ?worker ?y)                 ;Object worker moves to location Y
                (clear ?x)                      ;There is no object in location X anymore
                (not (at ?worker ?x))           ;Object worker leaves location X
                (not (clear ?y)))               ;There is an object moved to location Y
    )
    
    (:action pushLeft                           ;A worker pushes a crate leftwards
        :parameters (?worker ?x ?y ?z ?crate)
        :precondition (and 
                (worker ?worker)                ;Object worker must be a Worker
                (at ?worker ?x)                 ;Object worker must be at location X
                (crate ?crate)                  ;Object crate must be a Crate
                (at ?crate ?y)                  ;Object crate must be at location Y
                (leftOf ?y ?x)                  ;Worker's location X must be to the right of the crate's location Y
                (leftOf ?z ?y)                  ;Destination Z must be to the left of the crate's location Y
                (clear ?z))                     ;Destination Z must be empty, crate can be pushed freely
        :effect (and 
                (at ?worker ?y)                 ;Object worker moves to location Y
                (at ?crate ?z)                  ;Object crate moves to location Z
                (clear ?x)                      ;There is no object in location X anymore
                (not (at ?worker ?x))           ;Object worker leaves location X
                (not (at ?crate ?y))            ;Object crate leaves location Y
                (not (clear ?y))                ;There is an object moved to location Y
                (not (clear ?z)))               ;There is an object moved to location Z
    )
    
    (:action pushRight                          ;A worker pushes a crate rightwards
        :parameters (?worker ?x ?y ?z ?crate)
        :precondition (and 
                (worker ?worker)                ;Object worker must be a Worker
                (at ?worker ?x)                 ;Object worker must be at location X
                (crate ?crate)                  ;Object crate must be a Crate
                (at ?crate ?y)                  ;Object crate must be at location Y
                (leftOf ?x ?y)                  ;Worker's location X must be to the right of the crate's location Y
                (leftOf ?y ?z)                  ;Destination Z must be to the left of the crate's location Y
                (clear ?z))                     ;Destination Z must be empty, crate can be pushed freely
        :effect (and 
                (at ?worker ?y)                 ;Object worker moves to location Y
                (at ?crate ?z)                  ;Object crate moves to location Z
                (clear ?x)                      ;There is no object in location X anymore
                (not (at ?worker ?x))           ;Object worker leaves location X
                (not (at ?crate ?y))            ;Object crate leaves location Y
                (not (clear ?y))                ;There is an object moved to location Y
                (not (clear ?z)))               ;There is an object moved to location Z
    )
    
    (:action pushUp                             ;A worker pushes a crate upwards
        :parameters (?worker ?x ?y ?z ?crate)
        :precondition (and 
                (worker ?worker)                ;Object worker must be a Worker
                (at ?worker ?x)                 ;Object worker must be at location X
                (crate ?crate)                  ;Object crate must be a Crate
                (at ?crate ?y)                  ;Object crate must be at location Y
                (below ?x ?y)                   ;Worker's location X must be to the right of the crate's location Y
                (below ?y ?z)                   ;Destination Z must be to the left of the crate's location Y
                (clear ?z))                     ;Destination Z must be empty, crate can be pushed freely
        :effect (and 
                (at ?worker ?y)                 ;Object worker moves to location Y
                (at ?crate ?z)                  ;Object crate moves to location Z
                (clear ?x)                      ;There is no object in location X anymore
                (not (at ?worker ?x))           ;Object worker leaves location X
                (not (at ?crate ?y))            ;Object crate leaves location Y
                (not (clear ?y))                ;There is an object moved to location Y
                (not (clear ?z)))               ;There is an object moved to location Z
    )
    
    (:action pushDown                           ;A worker pushes a crate downwards
        :parameters (?worker ?x ?y ?z ?crate)
        :precondition (and 
                (worker ?worker)                ;Object worker must be a Worker
                (at ?worker ?x)                 ;Object worker must be at location X
                (crate ?crate)                  ;Object crate must be a Crate
                (at ?crate ?y)                  ;Object crate must be at location Y
                (below ?y ?x)                   ;Worker's location X must be to the right of the crate's location Y
                (below ?z ?y)                   ;Destination Z must be to the left of the crate's location Y
                (clear ?z))                     ;Destination Z must be empty, crate can be pushed freely
        :effect (and 
                (at ?worker ?y)                 ;Object worker moves to location Y
                (at ?crate ?z)                  ;Object crate moves to location Z
                (clear ?x)                      ;There is no object in location X anymore
                (not (at ?worker ?x))           ;Object worker leaves location X
                (not (at ?crate ?y))            ;Object crate leaves location Y
                (not (clear ?y))                ;There is an object moved to location Y
                (not (clear ?z)))               ;There is an object moved to location Z
    )
)