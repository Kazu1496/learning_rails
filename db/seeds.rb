# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Entry.create(title: 'はじめてのエントリー', body: 'はじめまして！')
Entry.create(title: '2番目のエントリー', body: 'おひさしぶりです！')
Entry.create(title: '3番目のエントリー', body: 'もうくじけました・・・')
Comment.create(body: 'てすてす', status: 'approved', entry_id: '1')
Comment.create(body: 'どうもどうも', status: 'unapproved', entry_id: '1')
Comment.create(body: 'こんにちはこんにちは！	', status: 'approved', entry_id: '3')
