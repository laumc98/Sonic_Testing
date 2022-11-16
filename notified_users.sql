/* AA : Sonic : notified users: prod */ 
SELECT
   TRIM('"' FROM JSON_EXTRACT(notifications.context, '$.opportunityId')) AS 'Alfa ID',
   people.id as person_id,
   people.name,
   people.email,
   people.phone,
   notifications.template,
   notifications.send_at AS date,
   notifications.context
FROM
   notifications
   LEFT JOIN people ON notifications.to = people.id
WHERE
    (
        (
            notifications.template = 'career-advisor-job-opportunity'
            OR notifications.template = 'career-advisor-invited-job-opportunity'
            OR notifications.template = 'career-advisor-sourcing-already-exist'
            OR notifications.template = 'career-advisor-sourcing-first-evaluation-matrix-a'
            OR notifications.template = 'career-advisor-sourcing-first-evaluation-matrix-b'
            OR notifications.template = 'career-advisor-sourcing-first-evaluation-matrix-c'
            OR notifications.template = 'career-advisor-sourcing-first-evaluation'
            OR notifications.template = 'career-advisor-syndication-first-evaluation'
            OR notifications.template = 'career-advisor-invited-similar-job-opportunity'
            OR notifications.template = 'talent-candidate-manually-invited'
            OR notifications.template = 'career-advisor-manual-invited-reminder'
            OR notifications.template = 'talent-candidate-invited'
            OR notifications.template = 'career-advisor-syndication-already-exist'
        )
        AND notifications.status = 'sent'
    )