
data='
{
    "positions": [
        { "name": "drone1", "x": "23.56743", "y": "63.88765", "z": "82.1" },
        { "name": "drone2", "x": "22.56743", "y": "11.54375", "z": "102.2" },
        { "name": "drone3", "x": "16.56743", "y": "88.25615", "z": "170.7" },
        { "name": "drone4", "x": "14.72167", "y": "62.87765", "z": "10.1" },
        { "name": "drone5", "x": "11.15623", "y": "47.23715", "z": "88.2" }
    ]
}
'

echo "$data" | nc -u -w 1 localhost 14000

#cat dist.txt | nc -u -w 1 localhost 14000
