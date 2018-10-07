# gremlins inc clone

server and client, both in dart, communicate over websocket using protobuf 3 wire format

## server
- supports 1 turn of movement and play
- prevents out-of-turn actions and incorrect action types like moving when you need to play a card
- no data vaildation (player has card, player has resources)
- no effects of any kind
- card data only contains effect-less cards
- [game data](https://docs.google.com/spreadsheets/d/1woX6YMdenq2Qqe7q6SPqAZSrz6gGe7WYufzotq2XUak/edit?usp=sharing)
- shelf server
- no tests
## client
- no interface, received data is printed to the console
- button uses first card in hand to move 2 squares
- button plays first card in hand
- player-secret information not exposed to other players
- no tests
