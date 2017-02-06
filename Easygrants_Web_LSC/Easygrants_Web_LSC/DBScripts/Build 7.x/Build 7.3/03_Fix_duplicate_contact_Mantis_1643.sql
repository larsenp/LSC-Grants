declare @old_person_id int, @new_user_id int, @new_person_id int

select @old_person_id = min(person_id)
    from easygrants_user 
    where login_username = 'kp@lafl.org'

select @new_user_id = max(easygrants_user_id),
    @new_person_id = max(person_id)
    from easygrants_user 
    where login_username = 'kp@lafl.org'

update grantee_project
    set primary_person_id = @old_person_id
    where primary_person_id = @new_person_id

update wf_task_assignment
    set person_id = @old_person_id
    where person_id = @new_person_id

update easygrants_user
    set locked = 1
    where easygrants_user_id = @new_user_id
