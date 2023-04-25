-- https://mystery.knightlab.com/

-- murderer
select p.*
from person as p
join get_fit_now_member as m ON p.id = m.person_id
join get_fit_now_check_in as c ON c.membership_id = m.id
join drivers_license as d ON d.id = p.license_id
where c.check_in_date = '20180109'
and m.id LIKE '48Z%'
and d.plate_number LIKE '%H42W%';

-- brains
select p.*, COUNT(f.person_id)
from person as p
left join drivers_license as d ON d.id = p.license_id
left join facebook_event_checkin as f ON p.id = f.person_id
where d.height BETWEEN 65 AND 67
and d.hair_color = 'red'
and d.car_model = 'Model S'
and d.car_make = 'Tesla'
and f.event_name = 'SQL Symphony Concert'
GROUP BY p.id
HAVING COUNT(f.person_id) = 3;