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
	track_a_13 - track
	track_b_1 - track
	track_c_1 - track
	track_c_2 - track
	track_c_3 - track
	track_c_4 - track
	track_c_5 - track
	track_c_6 - track
	track_c_7 - track
	track_c_8 - track
	track_c_9 - track
	track_c_10 - track
	track_c_11 - track
	track_c_12 - track
	track_c_13 - track
	track_c_14 - track
	track_c_15 - track
	track_c_16 - track
	track_c_17 - track
	track_c_18 - track
	track_c_19 - track
	track_c_20 - track
	track_c_21 - track
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
	(parking_disallowed track_a_13)
	(parking_disallowed track_b_1)
	(parking_disallowed track_entry)

	; track servicing
	; ================================ 
	(service_allowed track_b_1)

	; track lengths
	; ================================ 
	(= (track_length track_a_1) 80)
	(= (track_length track_a_2) 80)
	(= (track_length track_a_3) 80)
	(= (track_length track_a_4) 160)
	(= (track_length track_a_5) 80)
	(= (track_length track_a_6) 80)
	(= (track_length track_a_7) 80)
	(= (track_length track_a_8) 80)
	(= (track_length track_a_9) 80)
	(= (track_length track_a_10) 80)
	(= (track_length track_a_11) 160)
	(= (track_length track_a_12) 80)
	(= (track_length track_a_13) 80)
	(= (track_length track_b_1) 80)
	(= (track_length track_c_1) 80)
	(= (track_length track_c_2) 80)
	(= (track_length track_c_3) 80)
	(= (track_length track_c_4) 80)
	(= (track_length track_c_5) 80)
	(= (track_length track_c_6) 80)
	(= (track_length track_c_7) 80)
	(= (track_length track_c_8) 80)
	(= (track_length track_c_9) 80)
	(= (track_length track_c_10) 80)
	(= (track_length track_c_11) 80)
	(= (track_length track_c_12) 80)
	(= (track_length track_c_13) 80)
	(= (track_length track_c_14) 80)
	(= (track_length track_c_15) 80)
	(= (track_length track_c_16) 160)
	(= (track_length track_c_17) 80)
	(= (track_length track_c_18) 160)
	(= (track_length track_c_19) 80)
	(= (track_length track_c_20) 80)
	(= (track_length track_c_21) 80)
	(= (track_length track_entry) 80)

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
	(= (num_trains_on_track track_a_13) 0)
	(= (num_trains_on_track track_b_1) 0)
	(= (num_trains_on_track track_c_1) 0)
	(= (num_trains_on_track track_c_2) 0)
	(= (num_trains_on_track track_c_3) 0)
	(= (num_trains_on_track track_c_4) 0)
	(= (num_trains_on_track track_c_5) 0)
	(= (num_trains_on_track track_c_6) 0)
	(= (num_trains_on_track track_c_7) 0)
	(= (num_trains_on_track track_c_8) 0)
	(= (num_trains_on_track track_c_9) 0)
	(= (num_trains_on_track track_c_10) 0)
	(= (num_trains_on_track track_c_11) 0)
	(= (num_trains_on_track track_c_12) 0)
	(= (num_trains_on_track track_c_13) 0)
	(= (num_trains_on_track track_c_14) 0)
	(= (num_trains_on_track track_c_15) 0)
	(= (num_trains_on_track track_c_16) 0)
	(= (num_trains_on_track track_c_17) 0)
	(= (num_trains_on_track track_c_18) 0)
	(= (num_trains_on_track track_c_19) 0)
	(= (num_trains_on_track track_c_20) 0)
	(= (num_trains_on_track track_c_21) 0)
	(= (num_trains_on_track track_entry) 2)

	; track spaces
	; ================================ 
	(= (train_order_on_track train_0) 1)
	(= (train_order_on_track train_1) 2)

	; inter track connections
	; ================================ 
	(tracks_linked track_a_1 track_b_1)
	(tracks_linked track_a_2 track_b_1)
	(tracks_linked track_a_3 track_b_1)
	(tracks_linked track_a_4 track_b_1)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_7 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_9 track_b_1)
	(tracks_linked track_a_10 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_12 track_b_1)
	(tracks_linked track_a_13 track_b_1)
	(tracks_linked track_b_1 track_c_8)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_a_13 track_b_1)
	(tracks_linked track_b_1 track_c_4)
	(tracks_linked track_a_1 track_b_1)
	(tracks_linked track_b_1 track_c_10)
	(tracks_linked track_a_2 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_b_1 track_c_12)
	(tracks_linked track_b_1 track_c_1)
	(tracks_linked track_a_7 track_b_1)
	(tracks_linked track_a_4 track_b_1)
	(tracks_linked track_b_1 track_c_17)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_b_1 track_c_18)
	(tracks_linked track_a_7 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_10 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_13 track_b_1)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_b_1 track_c_13)
	(tracks_linked track_a_10 track_b_1)
	(tracks_linked track_a_1 track_b_1)
	(tracks_linked track_a_4 track_b_1)
	(tracks_linked track_a_3 track_b_1)
	(tracks_linked track_a_4 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_1 track_b_1)
	(tracks_linked track_b_1 track_c_6)
	(tracks_linked track_a_12 track_b_1)
	(tracks_linked track_a_2 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_9 track_b_1)
	(tracks_linked track_a_7 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_10 track_b_1)
	(tracks_linked track_b_1 track_c_18)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_1 track_b_1)
	(tracks_linked track_a_4 track_b_1)
	(tracks_linked track_a_13 track_b_1)
	(tracks_linked track_a_4 track_b_1)
	(tracks_linked track_a_10 track_b_1)
	(tracks_linked track_a_12 track_b_1)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_3 track_b_1)
	(tracks_linked track_a_3 track_b_1)
	(tracks_linked track_b_1 track_c_17)
	(tracks_linked track_a_10 track_b_1)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_a_3 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_10 track_b_1)
	(tracks_linked track_a_9 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_12 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_10 track_b_1)
	(tracks_linked track_a_9 track_b_1)
	(tracks_linked track_b_1 track_c_17)
	(tracks_linked track_a_13 track_b_1)
	(tracks_linked track_a_7 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_10 track_b_1)
	(tracks_linked track_a_1 track_b_1)
	(tracks_linked track_a_12 track_b_1)
	(tracks_linked track_a_1 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_9 track_b_1)
	(tracks_linked track_a_3 track_b_1)
	(tracks_linked track_a_9 track_b_1)
	(tracks_linked track_a_3 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_1 track_b_1)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_b_1 track_c_15)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_2 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_1 track_b_1)
	(tracks_linked track_a_13 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_a_9 track_b_1)
	(tracks_linked track_a_3 track_b_1)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_2 track_b_1)
	(tracks_linked track_a_2 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_b_1 track_c_15)
	(tracks_linked track_a_13 track_b_1)
	(tracks_linked track_b_1 track_c_15)
	(tracks_linked track_b_1 track_c_21)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_12 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_a_9 track_b_1)
	(tracks_linked track_a_1 track_b_1)
	(tracks_linked track_a_12 track_b_1)
	(tracks_linked track_a_6 track_b_1)
	(tracks_linked track_a_7 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_8 track_b_1)
	(tracks_linked track_a_2 track_b_1)
	(tracks_linked track_a_11 track_b_1)
	(tracks_linked track_b_1 track_c_17)
	(tracks_linked track_a_4 track_b_1)
	(tracks_linked track_a_3 track_b_1)
	(tracks_linked track_entry track_a_4)
	(tracks_linked track_entry track_a_13)
	(tracks_linked track_entry track_a_2)
	(tracks_linked track_entry track_a_3)
	(tracks_linked track_entry track_a_12)
	(tracks_linked track_entry track_a_9)
	(tracks_linked track_entry track_a_8)
	(tracks_linked track_entry track_a_5)
	(tracks_linked track_entry track_a_9)
	(tracks_linked track_entry track_a_12)
	(tracks_linked track_entry track_a_1)

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
	(= (train_length train_0) 80)
	(= (train_length train_1) 80)

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