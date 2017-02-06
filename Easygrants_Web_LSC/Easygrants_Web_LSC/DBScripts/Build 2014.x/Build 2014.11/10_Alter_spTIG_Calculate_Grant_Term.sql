ALTER PROCEDURE [dbo].[spTIG_Calculate_Grant_Term]
	@grantee_project_id INT

AS


Create table #p1
  (grantee_project_id int, 
   payment_number int, 
   requested_date datetime)

Insert into #p1 
   (grantee_project_id , 
    payment_number , 
    requested_date)
select 
   grantee_project_id, 
   payment_number, 
   requested_date 
from payment 
where payment_number = 1 
      and grantee_project_id = @grantee_project_id




Create Table #p2
    (grantee_project_id int, 
     payment_number int, 
     requested_date datetime)

;With x (grantee_project_id, payment_number )
   As (
       select grantee_project_id, Max(Payment_number)
       from payment
       where grantee_project_id = @grantee_project_id
       group by grantee_project_id)

Insert into #p2 
      (grantee_project_id , 
       payment_number , 
       requested_date )
 Select 
       x.grantee_project_id, 
       x.payment_number,
       p.requested_date
 From payment p 
       JOIN x on p.payment_number = x.payment_number and p.grantee_project_id = x.grantee_project_id
 Where x.grantee_project_id = @grantee_project_id


SELECT
      #p1.Grantee_project_id ID,
      #p2.payment_number LastPaymentNumber,
      DateDiff( Month, #p1.requested_date, #p2.requested_date) + 1 GrantTerm
FROM 
    #p1 
      JOIN #p2 ON #p1.grantee_project_id = #p2.grantee_project_id
