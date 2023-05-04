create index tag_id_tweets  on tweet_tags(tag, id_tweets);
create index id_tweets_tag on tweet_tags(id_tweets,tag);
create index id_tweets_lang on tweets(id_tweets,lang);
create index gin_to_tsvector on tweets using gin(to_tsvector('english', text)) where lang='en';

