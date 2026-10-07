-- Conversion rate by device category (desktop / mobile / tablet)

SELECT
  device.category AS device_category,
  COUNT(DISTINCT CASE WHEN event_name = 'view_item' THEN user_pseudo_id END) AS users_view_item,
  COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_pseudo_id END) AS users_purchase
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX BETWEEN '20201201' AND '20210131'
GROUP BY device_category
ORDER BY users_view_item DESC
