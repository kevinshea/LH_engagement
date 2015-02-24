# Query to return:
#     number of users who signed up from each source
#     number of users from each source who sent a message
#     % of active users (i.e. users who sent a message) from each source 

SELECT source,
       sum(total_users) as total_users,
       sum(total_senders) as users_who_sent_message,
       sum(total_senders)/sum(total_users) as percent_active_users
FROM
  ( SELECT distinct u.source as source,
          u.user_id as user_signup,
          m.user_from as user_sender,
          1 as total_users,
          IF(m.user_from IS NULL, 0, 1) as total_senders
    FROM users u
        LEFT OUTER JOIN messages m
        on u.user_id = m.user_from ) users_and_users_who_sent
GROUP BY source
