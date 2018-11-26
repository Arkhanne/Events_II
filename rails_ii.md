# Ruby on Rails: Level II

## User Acounts: Model

```shell
rails g resource user name email password:digest
rails db:migrate
```

--> Install bcrypt gem

```shell
> u = User.new
 => #<User id: nil, name: nil, email: nil, password_digest: nil, created_at: nil, updated_at: nil>
> u.save
  User Exists (0.5ms)  SELECT  1 AS one FROM "users" WHERE "users"."email" IS NULL LIMIT ?  [["LIMIT", 1]]
 => false
> u.errors.full_messages
 => ["Password can't be blank", "Name can't be blank", "Email can't be blank", "Email is invalid"]
> u.name = "Mike"
 => "Mike"
> u.email = "mike@example.com"
 => "mike@example.com"
> u.password = "secret"
 => "secret"
> u.password_digest
 => "$2a$10$T.sfDKcLksiJvPnn4nfkLOVprOcVBrZsGT9zXUYpWV1XY4nqXhnSi"
> u.password_confirmation = "sss"
 => "sss"
> u.save
  User Exists (0.5ms)  SELECT  1 AS one FROM "users" WHERE LOWER("users"."email") = LOWER(?) LIMIT ?  [["email", "mike@example.com"], ["LIMIT", 1]]
 => false
> u.errors.full_messages
 => ["Password confirmation doesn't match Password"]
> u.password_confirmation = "secret"
 => "secret"
> u.save
  User Exists (0.1ms)  SELECT  1 AS one FROM "users" WHERE LOWER("users"."email") = LOWER(?) LIMIT ?  [["email", "mike@example.com"], ["LIMIT", 1]]
  SQL (0.3ms)  INSERT INTO "users" ("name", "email", "password_digest", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "Mike"], ["email", "mike@example.com"], ["password_digest", "$2a$10$T.sfDKcLksiJvPnn4nfkLOVprOcVBrZsGT9zXUYpWV1XY4nqXhnSi"], ["created_at", "2018-11-26 11:39:22.734016"], ["updated_at", "2018-11-26 11:39:22.734016"]]
 => true
```
