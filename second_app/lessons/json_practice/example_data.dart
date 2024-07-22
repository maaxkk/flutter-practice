import 'package:second_app/json_practice/address.dart';
import 'package:second_app/json_practice/human.dart';

final humans = [
  Human(
    name: 'John',
    surname: 'Smith',
    age: 17,
    addresses: [
      Address(city: 'London', street: 'Baker Street', house: '12A', flat: 12),
      Address(city: 'Manchester', street: 'High Street', house: '1', flat: 1),
      Address(
          city: 'Edinburgh', street: 'Rose Street', house: '198G', flat: 561),
    ],
  ),
  Human(
    name: 'Peter',
    surname: 'Johnson',
    age: 17,
    addresses: [
      Address(city: 'London', street: "King's Road", house: '54', flat: 67),
      Address(
          city: 'Birmingham', street: 'Queen Street', house: '23', flat: 56),
      Address(city: 'Leeds', street: 'Market Street', house: '13B', flat: 12),
    ],
  ),
];

const jsonString = '''
  [
    {
        "first_name": "John",
        "surname": "Smith",
        "age": 17,
        "addresses": [
            {
                "city": "London",
                "street": "Baker Street",
                "house": "12A",
                "flat": 12
            },
            {
                "city": "Manchester",
                "street": "High Street",
                "house": "1",
                "flat": 1
            },
            {
                "city": "Edinburgh",
                "street": "Rose Street",
                "house": "198G",
                "flat": 561
            }
        ]
    },
    {
        "first_name": "Peter",
        "surname": "Johnson",
        "age": 17,
        "addresses": [
            {
                "city": "London",
                "street": "King's Road",
                "house": "54",
                "flat": 67
            },
            {
                "city": "Birmingham",
                "street": "Queen Street",
                "house": "23",
                "flat": 56
            },
            {
                "city": "Leeds",
                "street": "Market Street",
                "house": "13B",
                "flat": 12
            }
        ]
    }
  ]
  ''';
