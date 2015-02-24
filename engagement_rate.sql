# Query to return:
#     number of users who signed up from each source
#     number of users from each source who sent a message
#     % of active users (i.e. users who sent a message) from each source

SELECT source,
       count(user_signup) as count_total_users,
       count(user_sender) as count_total_senders,
       count(user_sender)/count(user_signup) as percent_active_users
FROM
  ( SELECT distinct u.source as source,
          u.user_id as user_signup,
          m.user_from as user_sender
    FROM users u
        LEFT OUTER JOIN messages m
          ON u.user_id = m.user_from ) users_and_users_who_sent
GROUP BY source
