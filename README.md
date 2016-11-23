# TxtResume
A little diddy to help produce a TXT record resume.

Example usage:

```ruby
me = Person.new(
  name: 'Jerry Smith',
  email: 'jerry@example.org',
  website: 'http://example.com',
  github: 'https://github.com/jerrysmith',
  blurb: 'A description about yourself'
  jobs: [
    Job.new(name: 'Advertising', years: '2011-present', blurb: 'What you did at this job'),
    Job.new(name: 'Civics', years: '2000-2011', blurb: 'what you did at this job')
  ],
  other_blurbs: [
    'One thing you did one time',
    'Another thing you did another time'
  ]
)

TxtResume.new(me).print
```

Output:

```
01,+-----------------------------------------------------------------------------------+
02,|  Jerry Smith (jerry@example.org)                                                  |
03,|  http://example.com || https://github.com/jerrysmith                              |
04,|                                                                                   |
05,|  A description about yourself                                                     |
06,|                                                                                   |
07,|  Advertising (2011-present)                                                       |
08,|  What you did at this job                                                         |
09,|                                                                                   |
10,|  Civics (2000-2011)                                                               |
11,|  what you did at this job                                                         |
12,|                                                                                   |
13,|  One thing you did one time                                                       |
14,|  Another thing you did another time                                               |
15,+-----------------------------------------------------------------------------------+
```
