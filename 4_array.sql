ALTER TABLE communities ADD COLUMN members INT [];

UPDATE communities
  SET members = 
  (SELECT array_agg(user_id) FROM communities_users 
  WHERE community_id = communities.id)
  WHERE id = 3;
