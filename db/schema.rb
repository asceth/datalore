# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120529135848) do

  create_table "bans", :force => true do |t|
    t.integer  "user_id"
    t.integer  "server_id"
    t.integer  "network_id"
    t.boolean  "permanent"
    t.datetime "ends_at"
    t.string   "network_identifier"
    t.string   "reason"
    t.integer  "removed_by"
    t.datetime "removed_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "message"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["created_at", "commentable_id", "commentable_type"], :name => "index_comments_on_created_at_and_commentable_id_and_commentable"

  create_table "conversation_messages", :force => true do |t|
    t.text     "message"
    t.integer  "conversation_participant_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "conversation_messages", ["conversation_id"], :name => "index_conversation_messages_on_conversation_id"
  add_index "conversation_messages", ["conversation_participant_id"], :name => "index_conversation_messages_on_conversation_participant_id"
  add_index "conversation_messages", ["deleted_at"], :name => "index_conversation_messages_on_deleted_at"

  create_table "conversation_participants", :force => true do |t|
    t.boolean  "new_messages",    :default => false
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "conversation_participants", ["conversation_id"], :name => "index_conversation_participants_on_conversation_id"
  add_index "conversation_participants", ["deleted_at"], :name => "index_conversation_participants_on_deleted_at"
  add_index "conversation_participants", ["user_id"], :name => "index_conversation_participants_on_user_id"

  create_table "conversations", :force => true do |t|
    t.string   "subject"
    t.integer  "conversation_message_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "events", :force => true do |t|
    t.integer  "actor_id"
    t.string   "actor_type"
    t.integer  "objectable_id"
    t.string   "objectable_type"
    t.string   "event_type"
    t.boolean  "public",             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "object_parent_id"
    t.string   "object_parent_type"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "events", ["actor_id", "actor_type"], :name => "index_events_on_actor_id_and_actor_type"
  add_index "events", ["created_at"], :name => "index_events_on_created_at"
  add_index "events", ["deleted_at"], :name => "index_events_on_deleted_at"
  add_index "events", ["event_type"], :name => "index_events_on_event_type"
  add_index "events", ["object_parent_id", "object_parent_type"], :name => "index_events_on_object_parent_id_and_object_parent_type"
  add_index "events", ["objectable_id", "objectable_type"], :name => "index_events_on_object_id_and_object_type"
  add_index "events", ["public"], :name => "index_events_on_public"

  create_table "events_archive", :force => true do |t|
    t.integer  "actor_id"
    t.string   "actor_type"
    t.integer  "object_id"
    t.string   "object_type"
    t.string   "event_type"
    t.boolean  "public",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events_archive", ["actor_id", "actor_type"], :name => "index_events_archive_on_actor_id_and_actor_type"

  create_table "fields", :force => true do |t|
    t.integer  "report_id"
    t.boolean  "filterable",  :default => false
    t.boolean  "displayable", :default => false
    t.boolean  "groupable",   :default => false
    t.string   "name"
    t.string   "table_name"
    t.string   "column_name"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "forum_categories", :force => true do |t|
    t.string   "name",        :limit => nil, :default => ""
    t.integer  "position",                   :default => 0
    t.string   "access_role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "forum_categories", ["position"], :name => "forum_categories_position_index"
  add_index "forum_categories", ["position"], :name => "index_forum_categories_on_position"

  create_table "forum_poll_options", :force => true do |t|
    t.string   "option_text",            :limit => 80,                :null => false
    t.integer  "forum_poll_votes_count",               :default => 0
    t.integer  "forum_poll_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "forum_poll_options", ["forum_poll_id"], :name => "index_forum_poll_options_on_forum_poll_id"

  create_table "forum_poll_votes", :force => true do |t|
    t.integer  "forum_poll_option_id"
    t.integer  "forum_poll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "forum_poll_votes", ["forum_poll_option_id"], :name => "index_forum_poll_votes_on_forum_poll_option_id"

  create_table "forum_polls", :force => true do |t|
    t.string   "subject",                               :null => false
    t.integer  "forum_poll_votes_count", :default => 0
    t.integer  "forum_topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "forum_polls", ["forum_topic_id"], :name => "index_forum_polls_on_forum_topic_id"

  create_table "forum_posts", :force => true do |t|
    t.string   "user_host",      :limit => nil, :null => false
    t.text     "message",                       :null => false
    t.string   "updated_by",     :limit => nil
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "forum_topic_id"
    t.tsvector "message_tsv"
    t.integer  "created_by"
  end

  add_index "forum_posts", ["created_at"], :name => "forum_posts_created_at_index"
  add_index "forum_posts", ["forum_topic_id", "created_at"], :name => "index_forum_posts_on_forum_topic_id_and_created_at"
  add_index "forum_posts", ["forum_topic_id"], :name => "index_forum_posts_on_forum_topic_id"
  add_index "forum_posts", ["message_tsv"], :name => "forum_posts_message_tsv"

  create_table "forum_topics", :force => true do |t|
    t.string   "subject",           :limit => 75,                  :null => false
    t.integer  "forum_id"
    t.integer  "forum_posts_count",                :default => 0
    t.integer  "view_count",                       :default => 0
    t.boolean  "locked"
    t.boolean  "sticky"
    t.string   "tags",              :limit => nil, :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "replied_at"
    t.tsvector "subject_tsv"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "forum_topics", ["forum_id", "replied_at"], :name => "index_forum_topics_on_forum_id_and_replied_at"
  add_index "forum_topics", ["forum_id"], :name => "index_forum_topics_on_forum_id"
  add_index "forum_topics", ["replied_at"], :name => "forum_topics_replied_at_index"
  add_index "forum_topics", ["replied_at"], :name => "index_forum_topics_on_replied_at"
  add_index "forum_topics", ["sticky"], :name => "forum_topics_sticky_index"

  create_table "forums", :force => true do |t|
    t.string   "name",               :limit => nil,                :null => false
    t.text     "description"
    t.string   "redirect_url",       :limit => 196
    t.integer  "position",                          :default => 0
    t.integer  "forum_topics_count",                :default => 0
    t.integer  "forum_posts_count",                 :default => 0
    t.integer  "forum_category_id",                 :default => 0
    t.integer  "parent_id",                         :default => 0
    t.string   "allowed_topic_tags", :limit => 250
    t.string   "access_role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "forums", ["forum_category_id"], :name => "forums_forum_category_id_index"
  add_index "forums", ["forum_category_id"], :name => "index_forums_on_forum_category_id"
  add_index "forums", ["parent_id"], :name => "forums_parent_id_index"
  add_index "forums", ["parent_id"], :name => "index_forums_on_parent_id"
  add_index "forums", ["position"], :name => "forums_position_index"
  add_index "forums", ["position"], :name => "index_forums_on_position"

  create_table "game_companies", :force => true do |t|
    t.string   "name"
    t.boolean  "has_avatar"
    t.boolean  "game_developer",                 :default => false
    t.boolean  "console_developer",              :default => false
    t.boolean  "publisher",                      :default => false
    t.string   "location"
    t.string   "country_code",      :limit => 6
    t.datetime "founded"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "game_companies", ["console_developer"], :name => "index_game_companies_on_console_developer"
  add_index "game_companies", ["country_code"], :name => "index_game_companies_on_country_code"
  add_index "game_companies", ["deleted_at"], :name => "index_game_companies_on_deleted_at"
  add_index "game_companies", ["game_developer"], :name => "index_game_companies_on_game_developer"
  add_index "game_companies", ["publisher"], :name => "index_game_companies_on_publisher"

  create_table "game_genre_mappings", :force => true do |t|
    t.integer  "game_genre_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "game_genre_mappings", ["deleted_at"], :name => "index_game_genre_mappings_on_deleted_at"
  add_index "game_genre_mappings", ["game_genre_id"], :name => "index_game_genre_mappings_on_game_genre_id"
  add_index "game_genre_mappings", ["game_id"], :name => "index_game_genre_mappings_on_game_id"

  create_table "game_genres", :force => true do |t|
    t.string   "name"
    t.boolean  "has_avatar", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "game_genres", ["deleted_at"], :name => "index_game_genres_on_deleted_at"

  create_table "game_level_images", :force => true do |t|
    t.string   "file"
    t.string   "caption"
    t.integer  "game_level_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "game_levels", :force => true do |t|
    t.string   "name"
    t.boolean  "installed",  :default => false
    t.boolean  "has_avatar", :default => false
    t.boolean  "images",     :default => false
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "file"
  end

  add_index "game_levels", ["deleted_at"], :name => "index_game_levels_on_deleted_at"
  add_index "game_levels", ["game_id"], :name => "index_game_levels_on_game_id"
  add_index "game_levels", ["images"], :name => "index_game_levels_on_images"
  add_index "game_levels", ["installed"], :name => "index_game_levels_on_installed"
  add_index "game_levels", ["name", "game_id"], :name => "index_game_levels_on_name_and_game_id"

  create_table "game_platform_mappings", :force => true do |t|
    t.integer  "game_id"
    t.integer  "game_platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "game_platform_mappings", ["deleted_at"], :name => "index_game_platform_mappings_on_deleted_at"
  add_index "game_platform_mappings", ["game_id", "game_platform_id"], :name => "index_game_platform_mappings_on_game_id_and_game_platform_id"
  add_index "game_platform_mappings", ["game_id"], :name => "index_game_platform_mappings_on_game_id"
  add_index "game_platform_mappings", ["game_platform_id"], :name => "index_game_platform_mappings_on_game_platform_id"

  create_table "game_platforms", :force => true do |t|
    t.string   "name"
    t.boolean  "has_avatar",      :default => false
    t.datetime "launched_at"
    t.integer  "game_count",      :default => 0
    t.integer  "game_company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "game_platforms", ["deleted_at"], :name => "index_game_platforms_on_deleted_at"

  create_table "game_reviews", :force => true do |t|
    t.string   "title"
    t.string   "summary"
    t.text     "review"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "overall_score", :default => 0
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "game_reviews", ["game_id"], :name => "index_game_reviews_on_game_id"

  create_table "game_server_histories", :force => true do |t|
    t.integer  "players"
    t.integer  "bots"
    t.integer  "game_level_id"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "game_server_histories", ["created_at"], :name => "index_game_server_histories_on_created_at"
  add_index "game_server_histories", ["deleted_at"], :name => "index_game_server_histories_on_deleted_at"
  add_index "game_server_histories", ["game_level_id"], :name => "index_game_server_histories_on_game_level_id"
  add_index "game_server_histories", ["server_id"], :name => "index_game_server_histories_on_game_server_id"

  create_table "game_server_histories_old", :force => true do |t|
    t.integer  "players",                    :default => 0
    t.integer  "server_id"
    t.string   "map",         :limit => nil, :default => "Unknown"
    t.integer  "bots",                       :default => 0
    t.boolean  "private"
    t.string   "version",     :limit => nil, :default => ""
    t.string   "game_type",   :limit => nil, :default => "Unknown"
    t.text     "cvar_list",                  :default => ""
    t.integer  "offline",                    :default => 0
    t.text     "player_dump",                :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_servers_old", :force => true do |t|
    t.string   "name",                         :limit => nil,                   :null => false
    t.integer  "game_server_type_id"
    t.string   "host",                         :limit => nil,                   :null => false
    t.string   "numeric_ip",                   :limit => nil
    t.integer  "port",                                                          :null => false
    t.integer  "query_port",                                  :default => 0
    t.integer  "slots",                                       :default => 0
    t.string   "location",                     :limit => nil
    t.string   "country_code",                 :limit => nil
    t.integer  "active",                                      :default => 1
    t.integer  "monitored",                                   :default => 1
    t.integer  "sponsor_id",                                  :default => 0
    t.integer  "rank",                                        :default => -1
    t.integer  "user_id",                                     :default => 0
    t.integer  "game_server_history_count",                   :default => 0
    t.integer  "total_player_count_over_time",                :default => 0
    t.integer  "type_rank",                                   :default => -1
    t.float    "player_average",                              :default => 0.0
    t.integer  "recent_players",                              :default => 0
    t.string   "recent_map",                   :limit => nil
    t.boolean  "tainted"
    t.boolean  "private"
    t.boolean  "dedicated",                                   :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_servers_old", ["active"], :name => "game_servers_active_index"
  add_index "game_servers_old", ["monitored"], :name => "game_servers_monitored_index"
  add_index "game_servers_old", ["rank"], :name => "game_servers_rank_index"
  add_index "game_servers_old", ["sponsor_id"], :name => "game_servers_sponsor_id_index"
  add_index "game_servers_old", ["user_id"], :name => "game_servers_user_id_index"

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "has_avatar",      :default => false
    t.boolean  "images",          :default => false
    t.integer  "game_company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "age_rating"
    t.boolean  "expansion"
    t.boolean  "modification"
    t.integer  "game_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "avatar"
    t.string   "game_identifier"
  end

  create_table "joins", :force => true do |t|
    t.integer  "report_id"
    t.boolean  "root",               :default => false
    t.string   "primary_table_name"
    t.string   "primary_key"
    t.string   "foreign_table_name"
    t.string   "foreign_key"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "networks", :force => true do |t|
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "news_articles", :force => true do |t|
    t.string   "title",       :limit => 60,  :default => ""
    t.text     "content"
    t.text     "description"
    t.string   "author",      :limit => nil, :default => "GameSyn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "news_articles", ["created_at"], :name => "news_articles_created_at_index"

  create_table "pluses", :force => true do |t|
    t.integer  "plusable_id"
    t.string   "plusable_type"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "pluses", ["plusable_id", "plusable_type"], :name => "index_pluses_on_plusable_id_and_plusable_type"

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "score"
    t.integer  "rateable_id"
    t.string   "rateable_type", :limit => 32
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag"
    t.string   "facet"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "ratings", ["category", "tag", "facet"], :name => "index_ratings_on_category_and_tag_and_facet"
  add_index "ratings", ["category", "tag"], :name => "index_ratings_on_category_and_tag"
  add_index "ratings", ["category"], :name => "index_ratings_on_category"
  add_index "ratings", ["facet"], :name => "index_ratings_on_facet"
  add_index "ratings", ["rateable_id", "rateable_type"], :name => "index_ratings_on_rateable_id_and_rateable_type"
  add_index "ratings", ["tag"], :name => "index_ratings_on_tag"

  create_table "reports", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name",          :limit => nil
    t.integer  "priority"
    t.string   "nickname",      :limit => nil
    t.integer  "roleable_id"
    t.string   "roleable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.text     "user_ids"
  end

  add_index "roles", ["deleted_at"], :name => "index_user_roles_on_deleted_at"
  add_index "roles", ["roleable_id", "roleable_type", "name"], :name => "index_user_roles_on_roleable_id_and_roleable_type_and_name"
  add_index "roles", ["roleable_id", "roleable_type"], :name => "index_user_roles_on_roleable_id_and_roleable_type"

  create_table "server_admins", :force => true do |t|
    t.integer  "user_id"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "immunity",           :default => false
    t.string   "flags"
    t.string   "password"
    t.string   "network_identifier"
  end

  add_index "server_admins", ["deleted_at"], :name => "index_game_server_admins_on_deleted_at"
  add_index "server_admins", ["server_id"], :name => "index_game_server_admins_on_game_server_id"
  add_index "server_admins", ["user_id", "server_id"], :name => "index_game_server_admins_on_user_id_and_game_server_id"
  add_index "server_admins", ["user_id"], :name => "index_game_server_admins_on_user_id"

  create_table "server_levels", :force => true do |t|
    t.boolean  "cycled",        :default => false
    t.integer  "server_id"
    t.integer  "game_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "server_levels", ["deleted_at"], :name => "index_game_server_levels_on_deleted_at"
  add_index "server_levels", ["game_level_id"], :name => "index_game_server_levels_on_game_level_id"
  add_index "server_levels", ["server_id", "cycled"], :name => "index_game_server_levels_on_game_server_id_and_cycled"
  add_index "server_levels", ["server_id"], :name => "index_game_server_levels_on_game_server_id"

  create_table "server_players", :force => true do |t|
    t.string   "name"
    t.string   "score"
    t.integer  "user_id"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "network_identifier"
    t.integer  "internal_id"
  end

  add_index "server_players", ["created_at"], :name => "index_game_server_players_on_created_at"
  add_index "server_players", ["deleted_at"], :name => "index_game_server_players_on_deleted_at"
  add_index "server_players", ["server_id"], :name => "index_game_server_players_on_game_server_id"
  add_index "server_players", ["user_id"], :name => "index_game_server_players_on_user_id"

  create_table "server_profiles", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.integer  "port",          :default => 0
    t.integer  "slots",         :default => 0
    t.string   "location"
    t.string   "country_code"
    t.boolean  "password"
    t.boolean  "dedicated"
    t.boolean  "secure"
    t.boolean  "online",        :default => false
    t.integer  "game_id"
    t.integer  "game_level_id"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "server_profiles", ["deleted_at"], :name => "index_game_server_profiles_on_deleted_at"
  add_index "server_profiles", ["game_id", "game_level_id"], :name => "index_game_server_profiles_on_game_id_and_game_level_id"
  add_index "server_profiles", ["game_id"], :name => "index_game_server_profiles_on_game_id"
  add_index "server_profiles", ["game_level_id"], :name => "index_game_server_profiles_on_game_level_id"
  add_index "server_profiles", ["name"], :name => "index_game_server_profiles_on_name"

  create_table "servers", :force => true do |t|
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "data_received", :default => false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "active"
    t.string   "api_key"
    t.datetime "heartbeat_at"
  end

  add_index "servers", ["active"], :name => "index_game_servers_on_active"
  add_index "servers", ["login"], :name => "index_game_servers_on_login"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :limit => nil
    t.text     "data"
    t.datetime "updated_at"
  end

  create_table "statistics_game_servers_players_by_hours", :force => true do |t|
    t.integer  "total",      :default => 0
    t.integer  "unique",     :default => 0
    t.integer  "average",    :default => 0
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statistics_game_servers_players_by_hours", ["start_at"], :name => "index_statistics_game_servers_players_by_hours_on_start_at"

  create_table "template_fields", :force => true do |t|
    t.integer  "template_id"
    t.integer  "field_id"
    t.integer  "field_type"
    t.integer  "position"
    t.string   "name"
    t.string   "function"
    t.string   "value"
    t.string   "operator"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "templates", :force => true do |t|
    t.integer  "report_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "thumbs", :force => true do |t|
    t.integer  "thumbable_id"
    t.string   "thumbable_type"
    t.integer  "score",          :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "unreads", :force => true do |t|
    t.integer  "user_id"
    t.text     "json_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "unreads", ["id", "user_id"], :name => "index_unreads_on_id_and_user_id", :unique => true

  create_table "user_game_mappings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.boolean  "played"
    t.boolean  "owned"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "user_game_mappings", ["deleted_at"], :name => "index_user_game_mappings_on_deleted_at"

  create_table "user_messages", :force => true do |t|
    t.string   "subject",        :limit => 90,  :null => false
    t.integer  "user_id"
    t.text     "message",                       :null => false
    t.boolean  "read"
    t.string   "sender_name",    :limit => nil
    t.string   "recipient_name", :limit => nil
    t.datetime "deleted_at"
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "user_messages", ["recipient_id"], :name => "user_messages_recipient_id_index"
  add_index "user_messages", ["sender_id"], :name => "user_messages_sender_id_index"

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "role_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "user_roles", ["deleted_at"], :name => "index_user_role_mappings_on_deleted_at"
  add_index "user_roles", ["role_id"], :name => "index_user_role_mappings_on_user_role_id"
  add_index "user_roles", ["user_id"], :name => "index_user_role_mappings_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login",                           :limit => nil
    t.string   "email",                           :limit => nil
    t.string   "crypted_password",                :limit => 128
    t.string   "password_salt",                   :limit => 128
    t.string   "activation_code",                 :limit => 128
    t.datetime "activated_at"
    t.string   "forgotten_password_code",         :limit => 128
    t.datetime "forgotten_password_requested_at"
    t.string   "remember_token",                  :limit => 128
    t.datetime "remember_token_expires_at"
    t.boolean  "has_avatar"
    t.integer  "user_messages_count",                            :default => 0
    t.integer  "sent_user_messages_count",                       :default => 0
    t.integer  "new_user_messages_count",                        :default => 0
    t.string   "signature",                                      :default => ""
    t.datetime "birthday"
    t.string   "invitation_code",                 :limit => 128
    t.integer  "invites",                                        :default => 0
    t.integer  "invited_by"
    t.string   "highest_role",                    :limit => nil
    t.integer  "forum_topics_count",                             :default => 0
    t.integer  "forum_posts_count",                              :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_visit"
    t.string   "steamid",                         :limit => 60
    t.string   "aim",                             :limit => 60
    t.string   "icq",                             :limit => 60
    t.string   "msn",                             :limit => 60
    t.string   "yahoo",                           :limit => 60
    t.string   "time_zone",                                      :default => "UTC"
    t.datetime "deleted_at"
    t.integer  "experience",                                     :default => 0
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "persistence_token"
    t.text     "serialized_roles"
    t.string   "avatar"
  end

  add_index "users", ["deleted_at"], :name => "index_users_on_deleted_at"
  add_index "users", ["email"], :name => "users_email_index"
  add_index "users", ["updated_at"], :name => "index_users_on_updated_at"

  create_table "watched_items", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "watched_items", ["deleted_at"], :name => "index_watched_items_on_deleted_at"
  add_index "watched_items", ["item_id", "item_type"], :name => "index_watched_items_on_item_id_and_item_type"
  add_index "watched_items", ["user_id"], :name => "index_watched_items_on_user_id"

  create_table "watched_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "watched_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "watched_users", ["deleted_at"], :name => "index_watched_users_on_deleted_at"
  add_index "watched_users", ["user_id"], :name => "index_watched_users_on_user_id"
  add_index "watched_users", ["watched_id"], :name => "index_watched_users_on_watched_id"

end
