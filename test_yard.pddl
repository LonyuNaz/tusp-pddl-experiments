(define 
(problem test_yard)
(:domain dom_n)
(:objects
	; tracks
	; ================================ 
	track_a_1 - track
	track_b_2 - track
	track_c_3 - track
	track_c_4 - track
	track_b_5 - track
	track_b_6 - track
	track_a_7 - track
	track_c_8 - track
	track_c_9 - track
	track_a_10 - track
	track_c_11 - track
	track_c_12 - track
	track_a_13 - track
	track_a_14 - track
	track_c_15 - track
	track_entry - track

	; trains
	; ================================ 
	train_1 - train
	train_2 - train
)

(:init

	; metric
	; ================================ 
	(= (total-cost) 0)

	; track parking
	; ================================ 
	(parking_disallowed track_b_2)
	(parking_disallowed track_c_3)
	(parking_disallowed track_b_5)
	(parking_disallowed track_a_7)
	(parking_disallowed track_a_10)
	(parking_disallowed track_c_12)
	(parking_disallowed track_a_13)
	(parking_disallowed track_c_15)
	(parking_disallowed track_entry)

	; track servicing
	; ================================ 
	(service_allowed track_c_3)

	; track lengths
	; ================================ 
	(= (track_length track_a_1) 80)
	(= (track_length track_b_2) 80)
	(= (track_length track_c_3) 80)
	(= (track_length track_c_4) 80)
	(= (track_length track_b_5) 80)
	(= (track_length track_b_6) 80)
	(= (track_length track_a_7) 80)
	(= (track_length track_c_8) 80)
	(= (track_length track_c_9) 80)
	(= (track_length track_a_10) 80)
	(= (track_length track_c_11) 80)
	(= (track_length track_c_12) 80)
	(= (track_length track_a_13) 80)
	(= (track_length track_a_14) 80)
	(= (track_length track_c_15) 80)
	(= (track_length track_entry) 80)

	; track trains
	; ================================ 
	(= (num_trains_on_track track_a_1) 0)
	(= (num_trains_on_track track_b_2) 0)
	(= (num_trains_on_track track_c_3) 0)
	(= (num_trains_on_track track_c_4) 0)
	(= (num_trains_on_track track_b_5) 0)
	(= (num_trains_on_track track_b_6) 0)
	(= (num_trains_on_track track_a_7) 0)
	(= (num_trains_on_track track_c_8) 0)
	(= (num_trains_on_track track_c_9) 0)
	(= (num_trains_on_track track_a_10) 0)
	(= (num_trains_on_track track_c_11) 0)
	(= (num_trains_on_track track_c_12) 0)
	(= (num_trains_on_track track_a_13) 0)
	(= (num_trains_on_track track_a_14) 0)
	(= (num_trains_on_track track_c_15) 0)
	(= (num_trains_on_track track_entry) 2)

	; track spaces
	; ================================ 
	(= (train_order_on_track train_1) 1)
	(= (train_order_on_track train_2) 2)

	; inter track connections
	; ================================ 
	(tracks_linked track_a_1 track_b_2)
	(tracks_linked track_a_7 track_b_5)
	(tracks_linked track_a_10 track_b_6)
	(tracks_linked track_a_13 track_b_5)
	(tracks_linked track_a_14 track_b_2)
	(tracks_linked track_b_2 track_c_12)
	(tracks_linked track_b_5 track_c_3)
	(tracks_linked track_b_6 track_c_11)
	(tracks_linked track_a_10 track_b_5)
	(tracks_linked track_b_5 track_c_11)
	(tracks_linked track_a_14 track_b_6)
	(tracks_linked track_b_2 track_c_9)
	(tracks_linked track_a_1 track_b_6)
	(tracks_linked track_a_14 track_b_5)
	(tracks_linked track_a_13 track_b_6)
	(tracks_linked track_a_10 track_b_2)
	(tracks_linked track_a_13 track_b_2)
	(tracks_linked track_b_2 track_c_11)
	(tracks_linked track_a_7 track_b_6)
	(tracks_linked track_b_5 track_c_15)
	(tracks_linked track_b_5 track_c_12)
	(tracks_linked track_b_5 track_c_4)
	(tracks_linked track_b_5 track_c_9)
	(tracks_linked track_b_6 track_c_4)
	(tracks_linked track_a_1 track_b_5)
	(tracks_linked track_entry track_a_1)
	(tracks_linked track_entry track_a_7)
	(tracks_linked track_entry track_a_10)
	(tracks_linked track_entry track_a_13)
	(tracks_linked track_entry track_a_14)

	; train activity
	; ================================ 
	(is_active train_1)
	(is_active train_2)

	; train direction (default Aside)
	; ================================ 
	(is_direction_Aside train_1)
	(is_direction_Aside train_2)

	; train lengths
	; ================================ 
	(= (train_length train_1) 80)
	(= (train_length train_2) 80)

	; train locations
	; ================================ 
	(train_at train_1 track_entry)
	(train_at train_2 track_entry)


)

(:goal (and 

	; train goals
	; ================================ 
	(parkable train_1)
	(was_serviced train_1)
	(parkable train_2)
	(was_serviced train_2)

))

(:metric minimize (total-cost))
)