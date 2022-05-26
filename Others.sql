SELECT 
    *,
    SUM(CASE WHEN status='on' AND prev_status='off' THEN 1 ELSE 0 END) OVER(ORDER BY event_status)
    FROM(
        SELECT 
            *,
            LAG(status,1,status) OVER (ORDER BY ASC) AS prev_status
        FROM event_status 
    ) A
