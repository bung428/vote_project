# Vote project
- 111 percent task project 

## Framework Version
- Flutter 3.22.3
- Dart 3.4.4

## Project directory structure
.
├── data
│    ├── comment_repository_impl.dart
│    ├── user_repository_impl.dart
│    └── votes_repository_impl.dart
├── domain
│    ├── repository
│    │   ├── comment_repository.dart
│    │   ├── user_repository.dart
│    │   └── votes_repository.dart
│    └── use_case
│        ├── get_add_vote_use_case.dart
│        ├── get_comments_use_case.dart
│        ├── get_login_use_case.dart
│        ├── get_sign_up_use_case.dart
│        ├── get_vote_detail_use_case.dart
│        └── get_vote_use_case.dart
├── enums
│    └── gender.dart
├── firebase_options.dart
├── main.dart
├── models
│    ├── api
│    │   ├── comment_model.dart
│    │   ├── comment_model.freezed.dart
│    │   ├── comment_model.g.dart
│    │   ├── gender_count_model.dart
│    │   ├── gender_count_model.freezed.dart
│    │   ├── gender_count_model.g.dart
│    │   ├── user_model.dart
│    │   ├── user_model.freezed.dart
│    │   ├── user_model.g.dart
│    │   ├── vote_detail_model.dart
│    │   ├── vote_detail_model.freezed.dart
│    │   ├── vote_detail_model.g.dart
│    │   ├── vote_entry_model.dart
│    │   ├── vote_entry_model.freezed.dart
│    │   ├── vote_entry_model.g.dart
│    │   ├── vote_like_model.dart
│    │   ├── vote_like_model.freezed.dart
│    │   ├── vote_like_model.g.dart
│    │   ├── vote_model.dart
│    │   ├── vote_model.freezed.dart
│    │   └── vote_model.g.dart
│    └── ui
│        ├── comment_item_model.dart
│        ├── vote_card_footer_model.dart
│        ├── vote_card_model.dart
│        ├── vote_detail_data_model.dart
│        ├── vote_gender_rate_model.dart
│        └── vote_option_model.dart
├── pages
│    ├── add_vote
│    │   ├── add_vote_notifier.dart
│    │   └── add_vote_page.dart
│    ├── comment
│    │   ├── comment_notifier.dart
│    │   └── comment_page.dart
│    ├── detail
│    │   ├── vote_detail_notifier.dart
│    │   └── vote_detail_page.dart
│    ├── login
│    │   ├── login_notifier.dart
│    │   └── login_page.dart
│    ├── main
│    │   ├── main_notifier.dart
│    │   └── main_page.dart
│    ├── sign_up
│    │   ├── sign_up_notifier.dart
│    │   └── sign_up_page.dart
│    └── splash
│        └── splash_page.dart
├── route
│    ├── router.dart
│    └── routes.dart
├── service
│    ├── app_service.dart
│    ├── auth_service.dart
│    └── firestore_service.dart
├── util
│    ├── shared_preferences.dart
│    └── timestamp_converter.dart
└── widgets
├── app_button_widget.dart
├── app_check_box_widget.dart
├── app_text_field_widget.dart
├── detail
│   └── table_title_widget.dart
├── gradient_linear_progress_indicator.dart
├── touch_well_widget.dart
├── vote_card_widget.dart
└── vote_option_list_widget.dart


## Architecture
- page
- notifier
- domain
  - use-case
  - repository
- data

## Etc
1. Using the Firebase Firestore as a server
    - user
    - votes
      - comments
2. Log in, log out, add membership
3. Add voting creation and deletion (floating button, pop-up menu button)
4. Add comment function
5. Added 'Like' function
6. Add material3 theme


