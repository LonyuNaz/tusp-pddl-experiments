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
	track_c_1 - track
	track_d_1 - track
	track_d_2 - track
	track_d_3 - track
	track_d_4 - track
	track_d_5 - track
	track_d_6 - track
	track_d_7 - track
	track_d_8 - track
	track_d_9 - track
	track_d_10 - track
	track_d_11 - track
	track_e_1 - track
	track_e_2 - track
	track_e_3 - track
	track_e_4 - track
	track_e_5 - track
	track_e_6 - track
	track_e_7 - track
	track_e_8 - track
	track_e_9 - track
	track_entry - track

	; trains
	; ================================ 
	train_0 - train
	train_1 - train
	train_2 - train
	train_3 - train
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
	(parking_disallowed track_b_1)
	(parking_disallowed track_b_2)
	(parking_disallowed track_b_3)
	(parking_disallowed track_b_4)
	(parking_disallowed track_b_5)
	(parking_disallowed track_b_6)
	(parking_disallowed track_b_7)
	(parking_disallowed track_b_8)
	(parking_disallowed track_b_9)
	(parking_disallowed track_b_10)
	(parking_disallowed track_b_11)
	(parking_disallowed track_b_12)
	(parking_disallowed track_c_1)
	(parking_disallowed track_d_1)
	(parking_disallowed track_d_2)
	(parking_disallowed track_d_3)
	(parking_disallowed track_d_4)
	(parking_disallowed track_d_5)
	(parking_disallowed track_d_6)
	(parking_disallowed track_d_7)
	(parking_disallowed track_d_8)
	(parking_disallowed track_d_9)
	(parking_disallowed track_d_10)
	(parking_disallowed track_d_11)
	(parking_disallowed track_entry)

	; track servicing
	; ================================ 
	(service_allowed track_c_1)

	; track lengths
	; ================================ 
	(= (track_length track_a_1) 80)
	(= (track_length track_a_2) 160)
	(= (track_length track_a_3) 160)
	(= (track_length track_a_4) 160)
	(= (track_length track_a_5) 80)
	(= (track_length track_a_6) 160)
	(= (track_length track_a_7) 160)
	(= (track_length track_b_1) 240)
	(= (track_length track_b_2) 80)
	(= (track_length track_b_3) 160)
	(= (track_length track_b_4) 160)
	(= (track_length track_b_5) 80)
	(= (track_length track_b_6) 240)
	(= (track_length track_b_7) 80)
	(= (track_length track_b_8) 240)
	(= (track_length track_b_9) 320)
	(= (track_length track_b_10) 160)
	(= (track_length track_b_11) 80)
	(= (track_length track_b_12) 80)
	(= (track_length track_c_1) 80)
	(= (track_length track_d_1) 160)
	(= (track_length track_d_2) 160)
	(= (track_length track_d_3) 80)
	(= (track_length track_d_4) 80)
	(= (track_length track_d_5) 320)
	(= (track_length track_d_6) 160)
	(= (track_length track_d_7) 160)
	(= (track_length track_d_8) 80)
	(= (track_length track_d_9) 240)
	(= (track_length track_d_10) 240)
	(= (track_length track_d_11) 320)
	(= (track_length track_e_1) 80)
	(= (track_length track_e_2) 240)
	(= (track_length track_e_3) 160)
	(= (track_length track_e_4) 160)
	(= (track_length track_e_5) 240)
	(= (track_length track_e_6) 80)
	(= (track_length track_e_7) 160)
	(= (track_length track_e_8) 80)
	(= (track_length track_e_9) 160)
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
	(= (num_trains_on_track track_c_1) 0)
	(= (num_trains_on_track track_d_1) 0)
	(= (num_trains_on_track track_d_2) 0)
	(= (num_trains_on_track track_d_3) 0)
	(= (num_trains_on_track track_d_4) 0)
	(= (num_trains_on_track track_d_5) 0)
	(= (num_trains_on_track track_d_6) 0)
	(= (num_trains_on_track track_d_7) 0)
	(= (num_trains_on_track track_d_8) 0)
	(= (num_trains_on_track track_d_9) 0)
	(= (num_trains_on_track track_d_10) 0)
	(= (num_trains_on_track track_d_11) 0)
	(= (num_trains_on_track track_e_1) 0)
	(= (num_trains_on_track track_e_2) 0)
	(= (num_trains_on_track track_e_3) 0)
	(= (num_trains_on_track track_e_4) 0)
	(= (num_trains_on_track track_e_5) 0)
	(= (num_trains_on_track track_e_6) 0)
	(= (num_trains_on_track track_e_7) 0)
	(= (num_trains_on_track track_e_8) 0)
	(= (num_trains_on_track track_e_9) 0)
	(= (num_trains_on_track track_entry) 4)

	; track spaces
	; ================================ 
	(= (train_order_on_track train_0) 1)
	(= (train_order_on_track train_1) 2)
	(= (train_order_on_track train_2) 3)
	(= (train_order_on_track train_3) 4)

	; inter track connections
	; ================================ 
	(tracks_linked track_a_1 track_b_6)
	(tracks_linked track_a_2 track_b_5)
	(tracks_linked track_a_3 track_b_5)
	(tracks_linked track_a_4 track_b_2)
	(tracks_linked track_a_5 track_b_7)
	(tracks_linked track_a_6 track_b_8)
	(tracks_linked track_a_7 track_b_7)
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
	(tracks_linked track_c_1 track_d_1)
	(tracks_linked track_d_1 track_e_4)
	(tracks_linked track_d_2 track_e_9)
	(tracks_linked track_d_3 track_e_3)
	(tracks_linked track_d_4 track_e_4)
	(tracks_linked track_d_5 track_e_2)
	(tracks_linked track_d_6 track_e_7)
	(tracks_linked track_d_7 track_e_3)
	(tracks_linked track_d_8 track_e_1)
	(tracks_linked track_d_9 track_e_8)
	(tracks_linked track_d_10 track_e_2)
	(tracks_linked track_d_11 track_e_8)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_d_6 track_e_9)
	(tracks_linked track_b_9 track_c_1)
	(tracks_linked track_d_10 track_e_8)
	(tracks_linked track_b_6 track_c_1)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_b_12 track_c_1)
	(tracks_linked track_c_1 track_d_4)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_b_3 track_c_1)
	(tracks_linked track_d_10 track_e_1)
	(tracks_linked track_b_11 track_c_1)
	(tracks_linked track_a_7 track_b_5)
	(tracks_linked track_d_11 track_e_3)
	(tracks_linked track_c_1 track_d_4)
	(tracks_linked track_a_5 track_b_1)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_a_2 track_b_5)
	(tracks_linked track_b_7 track_c_1)
	(tracks_linked track_d_2 track_e_9)
	(tracks_linked track_d_6 track_e_9)
	(tracks_linked track_d_4 track_e_4)
	(tracks_linked track_d_11 track_e_6)
	(tracks_linked track_d_7 track_e_2)
	(tracks_linked track_a_2 track_b_9)
	(tracks_linked track_d_8 track_e_3)
	(tracks_linked track_d_3 track_e_4)
	(tracks_linked track_d_10 track_e_3)
	(tracks_linked track_b_10 track_c_1)
	(tracks_linked track_d_11 track_e_4)
	(tracks_linked track_a_4 track_b_12)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_d_8 track_e_9)
	(tracks_linked track_a_4 track_b_1)
	(tracks_linked track_a_4 track_b_5)
	(tracks_linked track_d_6 track_e_4)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_d_1 track_e_1)
	(tracks_linked track_d_6 track_e_3)
	(tracks_linked track_d_6 track_e_7)
	(tracks_linked track_d_5 track_e_1)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_a_6 track_b_12)
	(tracks_linked track_d_11 track_e_3)
	(tracks_linked track_a_2 track_b_3)
	(tracks_linked track_d_1 track_e_5)
	(tracks_linked track_d_9 track_e_9)
	(tracks_linked track_a_4 track_b_5)
	(tracks_linked track_d_2 track_e_8)
	(tracks_linked track_d_10 track_e_2)
	(tracks_linked track_b_11 track_c_1)
	(tracks_linked track_d_10 track_e_9)
	(tracks_linked track_b_7 track_c_1)
	(tracks_linked track_d_5 track_e_8)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_a_3 track_b_6)
	(tracks_linked track_d_10 track_e_3)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_d_4 track_e_7)
	(tracks_linked track_b_7 track_c_1)
	(tracks_linked track_a_5 track_b_4)
	(tracks_linked track_b_7 track_c_1)
	(tracks_linked track_d_7 track_e_1)
	(tracks_linked track_b_6 track_c_1)
	(tracks_linked track_d_7 track_e_2)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_a_1 track_b_5)
	(tracks_linked track_d_5 track_e_6)
	(tracks_linked track_d_9 track_e_9)
	(tracks_linked track_d_1 track_e_7)
	(tracks_linked track_d_11 track_e_4)
	(tracks_linked track_d_4 track_e_6)
	(tracks_linked track_d_1 track_e_6)
	(tracks_linked track_d_2 track_e_6)
	(tracks_linked track_b_9 track_c_1)
	(tracks_linked track_d_9 track_e_2)
	(tracks_linked track_a_5 track_b_10)
	(tracks_linked track_c_1 track_d_8)
	(tracks_linked track_d_2 track_e_2)
	(tracks_linked track_a_4 track_b_9)
	(tracks_linked track_d_10 track_e_7)
	(tracks_linked track_d_10 track_e_4)
	(tracks_linked track_a_4 track_b_2)
	(tracks_linked track_b_7 track_c_1)
	(tracks_linked track_d_3 track_e_8)
	(tracks_linked track_a_7 track_b_4)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_d_11 track_e_4)
	(tracks_linked track_d_11 track_e_9)
	(tracks_linked track_d_8 track_e_2)
	(tracks_linked track_b_2 track_c_1)
	(tracks_linked track_a_4 track_b_9)
	(tracks_linked track_d_8 track_e_8)
	(tracks_linked track_d_7 track_e_6)
	(tracks_linked track_c_1 track_d_1)
	(tracks_linked track_d_8 track_e_9)
	(tracks_linked track_b_1 track_c_1)
	(tracks_linked track_b_7 track_c_1)
	(tracks_linked track_c_1 track_d_9)
	(tracks_linked track_b_6 track_c_1)
	(tracks_linked track_b_9 track_c_1)
	(tracks_linked track_a_1 track_b_3)
	(tracks_linked track_d_1 track_e_8)
	(tracks_linked track_a_1 track_b_2)
	(tracks_linked track_c_1 track_d_7)
	(tracks_linked track_d_6 track_e_2)
	(tracks_linked track_d_8 track_e_2)
	(tracks_linked track_a_2 track_b_2)
	(tracks_linked track_a_6 track_b_7)
	(tracks_linked track_b_11 track_c_1)
	(tracks_linked track_d_3 track_e_2)
	(tracks_linked track_a_4 track_b_4)
	(tracks_linked track_d_11 track_e_1)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_d_6 track_e_6)
	(tracks_linked track_b_4 track_c_1)
	(tracks_linked track_b_2 track_c_1)
	(tracks_linked track_d_8 track_e_6)
	(tracks_linked track_d_7 track_e_5)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_d_6 track_e_8)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_b_8 track_c_1)
	(tracks_linked track_d_5 track_e_1)
	(tracks_linked track_d_2 track_e_9)
	(tracks_linked track_d_1 track_e_7)
	(tracks_linked track_b_5 track_c_1)
	(tracks_linked track_a_4 track_b_12)
	(tracks_linked track_entry track_a_6)
	(tracks_linked track_entry track_a_2)
	(tracks_linked track_entry track_a_1)
	(tracks_linked track_entry track_a_5)
	(tracks_linked track_entry track_a_7)

	; train activity
	; ================================ 
	(is_active train_0)
	(is_active train_1)
	(is_active train_2)
	(is_active train_3)

	; train direction (default Aside)
	; ================================ 
	(is_direction_Aside train_0)
	(is_direction_Aside train_1)
	(is_direction_Aside train_2)
	(is_direction_Aside train_3)

	; train lengths
	; ================================ 
	(= (train_length train_0) 80)
	(= (train_length train_1) 80)
	(= (train_length train_2) 80)
	(= (train_length train_3) 80)

	; train locations
	; ================================ 
	(train_at train_0 track_entry)
	(train_at train_1 track_entry)
	(train_at train_2 track_entry)
	(train_at train_3 track_entry)


)

(:goal (and 

	; train goals
	; ================================ 
	(is_parking train_0)
	(was_serviced train_0)
	(is_parking train_1)
	(was_serviced train_1)
	(is_parking train_2)
	(was_serviced train_2)
	(is_parking train_3)
	(was_serviced train_3)

))

(:metric minimize (total-cost))
)