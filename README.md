An SQL query to calculate engagement rate by signup source.

We find the total number of users from each source who sent a message then divide that by the total number of users who signed up from each source.

# USERS TABLE
* user_id - unique user identifier
* source - source from where user signed up (assumed user can only sign up from one source)
* created_at - date user created account

# MESSAGES TABLE
* message_id - unique identifier for message
* user_from - user_id of user who sent message
* user_to - user_id of user who received message
* medium - type of message sent (text, video, photo)
* created_at - date user sent message
