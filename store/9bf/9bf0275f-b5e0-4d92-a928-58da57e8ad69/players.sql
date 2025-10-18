ATTACH TABLE _ UUID 'fd492044-9276-443b-964f-9a0146a1bc0a'
(
    `idx` UInt32,
    `name` String,
    `full_name` String,
    `age` UInt8,
    `height` Float64,
    `nationality` String,
    `place_of_birth` String,
    `price` Float64,
    `max_price` Float64,
    `position` String,
    `shirt_nr` UInt8,
    `foot` String,
    `club` String,
    `contract_expires` String,
    `joined_club` String,
    `player_agent` String,
    `outfitter` String
)
ENGINE = MergeTree
ORDER BY idx
SETTINGS index_granularity = 8192
