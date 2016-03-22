# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.destroy_all
Author.destroy_all

Author.create([

{username: 'ryanwaits', email: 'ryan.waits@gmail.com', password_digest: BCrypt::Password.create('12345')},
{username: 'aledavila', email: 'adavila91@gmail.com', password_digest: BCrypt::Password.create('12345')}

])

Post.create([

{
    title: 'Renaming A Table', 
    body: '<p>Using the <pre><code>alter table</code></pre> command in PostgreSQL, you can rename an existing table. This command will also update any references to the table such as via foreign key constraints. Just run a command like the following:<pre><code>alter table ingredient_types rename to item_types;</code></pre></p><p>Note that this may result in breaking a number of conventions. Foreign keys, sequences, and constraints with names eponymous to the original table will no longer follow convention despite the references being updated. These can be renamed as well if desired.</p>', 
    hashtag: 'sql',
    author_id: Author.first.id
},
{
    title: 'Psql Help', 
    body: '<p>Psql includes a built-in help command that is amazing.</p><p>With no arguments, it returns all the help:</p><pre><code>app_development=# \hAvailable help:ABORT    ALTER TABLESPACE    CREATE FOREIGN TABLE...</code></pre><p>Plus we get this nicety:</p><blockquote>Note: To simplify typing, commands that consists of several words do not have to be quoted. Thus it is fine to type \help alter table.</blockquote><p>Write better SQL in your REPL today!</p><a href="http://www.postgresql.org/docs/current/static/app-psql.html">http://www.postgresql.org/docs/current/static/app-psql.html</a>', 
    hashtag: 'sql',
    author_id: Author.second.id
},
{
    title: 'Use `percentage()` instead of percentages in Sass', 
    body: '<p>Instead of writing out stuff like width: 66.667% for an element, let Sass take care of it for you with percentage:</p><pre><code>.thirds { width: percentage(1/3); }\n\n.two-thirds { width: percentage(2/3); }</code></pre>', 
    hashtag: 'html-css',
    author_id: Author.second.id
}

])





