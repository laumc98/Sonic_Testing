/* AA : SONIC : daily app per channel : prod */ 
SELECT
    date(opportunity_candidates.interested) AS application_date,
    opportunities.id AS ID,
    tracking_codes.utm_medium AS utm_medium, 
    tracking_codes.utm_source AS utm_source,
    count(*) AS applications
FROM 
    opportunity_candidates
    INNER JOIN opportunities ON opportunity_candidates.opportunity_id = opportunities.id
    LEFT JOIN tracking_code_candidates ON opportunity_candidates.id = tracking_code_candidates.candidate_id
    LEFT JOIN tracking_codes ON tracking_code_candidates.tracking_code_id = tracking_codes.id
WHERE 
    opportunity_candidates.interested IS NOT NULL
    AND opportunity_candidates.application_step IS NOT NULL
    AND opportunities.review = 'approved'
    AND DATE(opportunity_candidates.interested) > date(date_add(now(6), INTERVAL -3 month))
GROUP BY 
    date(opportunity_candidates.interested),
    opportunities.id,
    tracking_codes.utm_medium,
    tracking_codes.utm_source