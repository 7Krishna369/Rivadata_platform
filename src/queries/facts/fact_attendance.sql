select 
a.attendance_id,
ds.student_key,
a.attendance_status,
a.joined_at,
a.remarks,
case
    when a.attendance_status = 'Present' then 1
    else 0
    end as attendance_count,

case 
    when a.attendance_status = 'Present' then 1
    else 0
    end as present_flag,

case
    when a.attendance_status = 'Absent' then 1
    else 0
    end as absent_flag,

case 
    when a.attendance_status = 'Late' then 1
    else 0
    end as late_flag

from rivadata_platform.landing.attendance a

left join rivadata_platform.dataproduct.dim_student ds
on a.student_id = ds.student_id

left join rivadata_platform.dataproduct.dim_class dc
on a.class_id = dc.class_id

left join rivadata_platform.dataproduct.dim_batch db
on dc.batch_id = db.batch_id





