# README
* Setup environtment variable
- Create .env file
```
cd qa_project
cp .env.example .env
```

- change variable in `.env` file


* Create all dummy data
```
rails dummy_data:create
```
* if you don't want to create all, create dummy data separately

```
rails dummy_data:create_user
rails dummy_data:create_profile
rails dummy_data:create_category
rails dummy_data:create_tag
rails dummy_data:create_question
rails dummy_data:create_question_tags
rails dummy_data:create_answer
rails dummy_data:create_comment
```
