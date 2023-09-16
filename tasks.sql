/* AA : Sonic : tasks by candidate recruiters: prod */ 
SELECT
    tasks.*,
    opportunities.opportunity_id AS 'Alfa ID'
FROM
    tasks
    LEFT JOIN opportunities ON tasks.opportunity_id = opportunities.id
WHERE
    (tasks.completed_by IN ('1164202','1227372','50406','1465392','1072288','163315','1148423','257012','1171237','1135927','1328036','1201446','1072337','1205587','218202','879186','1217202','1558464')
        OR tasks.completed_by IS NULL)
    AND tasks.trigger IN ('paid-ext-networks','ext-networks','ext-sourcing','manual-task-creation','recruiter-bot-conversation-email','recruiter-bot-conversation-messenger','recruiter-bot-conversation-whatsapp','recruiter-bot-manual-reassign','otto-recruiter-bot-email','otto-recruiter-bot-messenger','otto-recruiter-bot-whatsapp')
    AND tasks.created >= '2023-01-01'