CREATE INDEX den_1 ON tweets_jsonb USING gin((data->'entities'->'hashtags'));
CREATE INDEX den_2 ON tweets_jsonb USING gin((data->'extended_tweet'->'entities'->'hashtags'));
CREATE INDEX den_3 ON tweets_jsonb USING gin((data->'lang'));
CREATE INDEX den_4 ON tweets_jsonb USING gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text'))) WHERE data->>'lang'='en';
CREATE INDEX den_5 ON tweets_jsonb USING gin(to_tsvector('english', COALESCE(data->'extended_tweet'->>'full_text', data->>'text')),
    (data->'entities'->'hashtags' || COALESCE(data->'extended_tweet'->'entities'->'hashtags','[]')));
