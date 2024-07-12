(define 
(problem test_yard)
(:domain dom_n)
(:objects
	; tracks
	; ================================ 
	track_a_1 - track
	track_a_2 - track
	track_a_3 - track
	track_a_4 - track
	track_a_5 - track
	track_a_6 - track
	track_a_7 - track
	track_a_8 - track
	track_a_9 - track
	track_a_10 - track
	track_a_11 - track
	track_a_12 - track
	track_b_1 - track
	track_b_2 - track
	track_b_3 - track
	track_b_4 - track
	track_b_5 - track
	track_b_6 - track
	track_b_7 - track
	track_b_8 - track
	track_b_9 - track
	track_b_10 - track
	track_b_11 - track
	track_b_12 - track
	track_b_13 - track
	track_b_14 - track
	track_b_15 - track
	track_b_16 - track
	track_b_17 - track
	track_c_1 - track
	track_entry - track

	; trains
	; ================================ 
	train_0 - train
	train_1 - train
)

(:init

	; metric
	; ================================ 
	(= (total-cost) 0)

	; track parking
	; ================================ 
	(parking_disallowed track_a_1)
	(parking_disallowed track_a_2)
	(parking_disallowed track_a_3)
	(parking_disallowed track_a_4)
	(parking_disallowed track_a_5)
	(parking_disallowed track_a_6)
	(parking_disallowed track_a_7)
	(parking_disallowed track_a_8)
	(parking_disallowed track_a_9)
	(parking_disallowed track_a_10)
	(parking_disallowed track_a_11)
	(parking_disallowed track_a_12)
	(parking_disallowed track_c_1)
	(parking_disallowed track_entry)

	; track servicing
	; ================================ 
	(service_allowed track_c_1)

	; track lengths
	; ================================ 
	(= (track_length track_a_1) 50)
	(= (track_length track_a_2) 100)
	(= (track_length track_a_3) 50)
	(= (track_length track_a_4) 50)
	(= (track_length track_a_5) 100)
	(= (track_length track_a_6) 100)
	(= (track_length track_a_7) 100)
	(= (track_length track_a_8) 100)
	(= (track_length track_a_9) 50)
	(= (track_length track_a_10) 50)
	(= (track_length track_a_11) 100)
	(= (track_length track_a_12) 100)
	(= (track_length track_b_1) 50)
	(= (track_length track_b_2) 50)
	(= (track_length track_b_3) 100)
	(= (track_length track_b_4) 50)
	(= (track_length track_b_5) 50)
	(= (track_length track_b_6) 50)
	(= (track_length track_b_7) 50)
	(= (track_length track_b_8) 50)
	(= (track_length track_b_9) 50)
	(= (track_length track_b_10) 100)
	(= (track_length track_b_11) 100)
	(= (track_length track_b_12) 50)
	(= (track_length track_b_13) 50)
	(= (track_length track_b_14) 50)
	(= (track_length track_b_15) 50)
	(= (track_length track_b_16) 50)
	(= (track_length track_b_17) 50)
	(= (track_length track_c_1) 50)
	(= (track_length track_entry) 50)

	; track trains
	; ================================ 
	(= (num_trains_on_track track_a_1) 0)
	(= (num_trains_on_track track_a_2) 0)
	(= (num_trains_on_track track_a_3) 0)
	(= (num_trains_on_track track_a_4) 0)
	(= (num_trains_on_track track_a_5) 0)
	(= (num_trains_on_track track_a_6) 0)
	(= (num_trains_on_track track_a_7) 0)
	(= (num_trains_on_track track_a_8) 0)
	(= (num_trains_on_track track_a_9) 0)
	(= (num_trains_on_track track_a_10) 0)
	(= (num_trains_on_track track_a_11) 0)
	(= (num_trains_on_track track_a_12) 0)
	(= (num_trains_on_track track_b_1) 0)
	(= (num_trains_on_track track_b_2) 0)
	(= (num_trains_on_track track_b_3) 0)
	(= (num_trains_on_track track_b_4) 0)
	(= (num_trains_on_track track_b_5) 0)
	(= (num_trains_on_track track_b_6) 0)
	(= (num_trains_on_track track_b_7) 0)
	(= (num_trains_on_track track_b_8) 0)
	(= (num_trains_on_track track_b_9) 0)
	(= (num_trains_on_track track_b_10) 0)
	(= (num_trains_on_track track_b_11) 0)
	(= (num_trains_on_track track_b_12) 0)
	(= (num_trains_on_track track_b_13) 0)
	(= (num_trains_on_track track_b_14) 0)
	(= (num_trains_on_track track_b_15) 0)
	(= (num_trains_on_track track_b_16) 0)
	(= (num_trains_on_track track_b_17) 0)
	(= (num_trains_on_track track_c_1) 0)
	(= (num_trains_on_track track_entry) 2)

	; track spaces
	; ================================ 
	(= (train_order_on_track train_0) 1)
	(= (train_order_on_track train_1) 2)

	; inter track connections
	; ================================ 
	(tracks_linked track_a_1 track_b_3)
	(tracks_linked track_a_2 track_b_10)
	(tracks_linked track_a_3 track_b_15)
	(tracks_linked track_a_4 track_b_1)
	(tracks_linked track_a_5 track_b_5)
	(tracks_linked track_a_6 track_b_5)
	(tracks_linked track_a_7 track_b_10)
	(tracks_linked track_a_8 track_b_15)
	(tracks_linked track_a_9 track_b_4)
	(tracks_linked track_a_10 track_b_10)
	(tracks_linked track_a_11 track_b_4)
	(tracks_linked track_a_12 track_b_12)
	(tracks_linked track_b_1 track_c_1)
	(tracks_linked track_b_2 track_c_1)
	(tracks_linked track_b_3 track_c_1)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_b_6 track_c_1)
	(tracks_linked track_b_7 track_c_1)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_b_9 track_c_1)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_b_11 track_c_1)
	(tracks_linked track_b_12 track_c_1)
	(tracks_linked track_b_13 track_c_1)
	(tracks_linked track_b_14 track_c_1)
	(tracks_linked track_b_15 track_c_1)
	(tracks_linked track_b_16 track_c_1)
	(tracks_linked track_b_17 track_c_1)
	(tracks_linked track_a_4 track_b_16)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_b_3 track_c_1)
	(tracks_linked track_a_10 track_b_11)
	(tracks_linked track_b_1 track_c_1)
	(tracks_linked track_b_6 track_c_1)
	(tracks_linked track_a_11 track_b_10)
	(tracks_linked track_b_14 track_c_1)
	(tracks_linked track_a_7 track_b_11)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_b_9 track_c_1)
	(tracks_linked track_b_13 track_c_1)
	(tracks_linked track_a_3 track_b_8)
	(tracks_linked track_a_8 track_b_13)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_a_4 track_b_2)
	(tracks_linked track_a_6 track_b_5)
	(tracks_linked track_b_14 track_c_1)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_a_1 track_b_11)
	(tracks_linked track_b_16 track_c_1)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_b_14 track_c_1)
	(tracks_linked track_a_8 track_b_4)
	(tracks_linked track_b_11 track_c_1)
	(tracks_linked track_b_3 track_c_1)
	(tracks_linked track_b_1 track_c_1)
	(tracks_linked track_b_12 track_c_1)
	(tracks_linked track_b_13 track_c_1)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_a_7 track_b_9)
	(tracks_linked track_b_9 track_c_1)
	(tracks_linked track_a_6 track_b_3)
	(tracks_linked track_b_2 track_c_1)
	(tracks_linked track_b_17 track_c_1)
	(tracks_linked track_a_11 track_b_7)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_b_15 track_c_1)
	(tracks_linked track_b_7 track_c_1)
	(tracks_linked track_b_16 track_c_1)
	(tracks_linked track_a_6 track_b_4)
	(tracks_linked track_a_10 track_b_13)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_a_9 track_b_3)
	(tracks_linked track_a_9 track_b_17)
	(tracks_linked track_a_8 track_b_17)
	(tracks_linked track_b_1 track_c_1)
	(tracks_linked track_b_11 track_c_1)
	(tracks_linked track_b_3 track_c_1)
	(tracks_linked track_b_6 track_c_1)
	(tracks_linked track_a_11 track_b_17)
	(tracks_linked track_b_3 track_c_1)
	(tracks_linked track_b_13 track_c_1)
	(tracks_linked track_b_6 track_c_1)
	(tracks_linked track_a_5 track_b_17)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_b_7 track_c_1)
	(tracks_linked track_a_4 track_b_14)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_b_15 track_c_1)
	(tracks_linked track_a_7 track_b_17)
	(tracks_linked track_a_7 track_b_12)
	(tracks_linked track_a_11 track_b_8)
	(tracks_linked track_a_6 track_b_10)
	(tracks_linked track_b_7 track_c_1)
	(tracks_linked track_b_12 track_c_1)
	(tracks_linked track_a_11 track_b_4)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_a_6 track_b_2)
	(tracks_linked track_a_2 track_b_7)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_a_10 track_b_12)
	(tracks_linked track_b_1 track_c_1)
	(tracks_linked track_a_2 track_b_15)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_a_8 track_b_16)
	(tracks_linked track_a_3 track_b_6)
	(tracks_linked track_a_4 track_b_6)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_a_8 track_b_3)
	(tracks_linked track_b_6 track_c_1)
	(tracks_linked track_b_2 track_c_1)
	(tracks_linked track_b_6 track_c_1)
	(tracks_linked track_b_15 track_c_1)
	(tracks_linked track_a_7 track_b_4)
	(tracks_linked track_b_6 track_c_1)
	(tracks_linked track_a_12 track_b_11)
	(tracks_linked track_b_13 track_c_1)
	(tracks_linked track_b_12 track_c_1)
	(tracks_linked track_a_9 track_b_17)
	(tracks_linked track_a_6 track_b_5)
	(tracks_linked track_b_11 track_c_1)
	(tracks_linked track_a_5 track_b_16)
	(tracks_linked track_a_12 track_b_13)
	(tracks_linked track_b_13 track_c_1)
	(tracks_linked track_a_1 track_b_2)
	(tracks_linked track_a_6 track_b_3)
	(tracks_linked track_b_15 track_c_1)
	(tracks_linked track_a_8 track_b_10)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_a_8 track_b_13)
	(tracks_linked track_a_2 track_b_8)
	(tracks_linked track_a_10 track_b_15)
	(tracks_linked track_a_3 track_b_13)
	(tracks_linked track_a_3 track_b_8)
	(tracks_linked track_a_8 track_b_9)
	(tracks_linked track_b_16 track_c_1)
	(tracks_linked track_b_17 track_c_1)
	(tracks_linked track_b_16 track_c_1)
	(tracks_linked track_a_9 track_b_5)
	(tracks_linked track_a_2 track_b_15)
	(tracks_linked track_b_11 track_c_1)
	(tracks_linked track_a_1 track_b_13)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_a_11 track_b_15)
	(tracks_linked track_b_15 track_c_1)
	(tracks_linked track_a_5 track_b_7)
	(tracks_linked track_b_11 track_c_1)
	(tracks_linked track_a_11 track_b_14)
	(tracks_linked track_b_15 track_c_1)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_b_11 track_c_1)
	(tracks_linked track_a_3 track_b_13)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_b_13 track_c_1)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_b_1 track_c_1)
	(tracks_linked track_a_8 track_b_13)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_b_1 track_c_1)
	(tracks_linked track_a_8 track_b_13)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_b_14 track_c_1)
	(tracks_linked track_a_7 track_b_6)
	(tracks_linked track_b_3 track_c_1)
	(tracks_linked track_a_5 track_b_11)
	(tracks_linked track_a_3 track_b_5)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_b_16 track_c_1)
	(tracks_linked track_a_9 track_b_6)
	(tracks_linked track_b_3 track_c_1)
	(tracks_linked track_a_4 track_b_12)
	(tracks_linked track_b_12 track_c_1)
	(tracks_linked track_a_3 track_b_3)
	(tracks_linked track_a_9 track_b_14)
	(tracks_linked track_b_1 track_c_1)
	(tracks_linked track_a_3 track_b_16)
	(tracks_linked track_entry track_a_4)
	(tracks_linked track_entry track_a_12)
	(tracks_linked track_entry track_a_8)
	(tracks_linked track_entry track_a_6)
	(tracks_linked track_entry track_a_8)
	(tracks_linked track_entry track_a_9)
	(tracks_linked track_entry track_a_10)
	(tracks_linked track_entry track_a_6)
	(tracks_linked track_entry track_a_7)

	; train activity
	; ================================ 
	(is_active train_0)
	(is_active train_1)

	; train direction (default Aside)
	; ================================ 
	(is_direction_Aside train_0)
	(is_direction_Aside train_1)

	; train lengths
	; ================================ 
	(= (train_length train_0) 50)
	(= (train_length train_1) 50)

	; train locations
	; ================================ 
	(train_at train_0 track_entry)
	(train_at train_1 track_entry)


)

(:goal (and 

	; train goals
	; ================================ 
	(is_parking train_0)
	(was_serviced train_0)
	(is_parking train_1)
	(was_serviced train_1)

))

(:metric minimize (total-cost))
)