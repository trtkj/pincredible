# Database design

## users table
| column | type | option |
| ---- | ---- | ---- |
| nickname | string | null: false |
| email | string | null: false, index: true, unique: true |
| pass | string | null: false |
| about | varchar(255) |  |
| avatar | string |  |

#### Association
- has_many :boards
- has_many :pins
- has_many :boards_pins

## boards table
| column | type | option |
| ---- | ---- | ---- |
| title | string | null: false |
| description | text |  |

#### Association
- has_many :pins, through :boards_pins
- belongs_to :user

## pins table
| column | type | option |
| ---- | ---- | ---- |
| title | text | null: false |
| image | string | null :false |
| user_id | integer | null: false |
| description | text |  |

#### Association
- belongs_to :user
- bhas_many :boards, through :boards_pins

## boards_pins table
| column | type | option |
| ---- | ---- | ---- |
| board_id | integer | null: false |
| pin_id | integer | null: false |

#### Association
- belongs_to :board
- belongs_to :pin
