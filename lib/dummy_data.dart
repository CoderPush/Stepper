import 'package:stepper/data/model/models.dart';

const String avatarProfileUrl =
    'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29tYW4lMjBwcm9maWxlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80';

final List<Area> scopeAreaList = [
  Area(
    areaName: 'S1',
    numberOfUpdate: 2,
    rating: 3,
    areaType: AreaType.scope,
    areaDescription:
        'You will write readable code, adhering to language, framework, and style-guide conventions. You follow good coding principles such as DRY, well scoped functions, and small commits.',
  ),
  Area(
    areaName: 'S2',
    numberOfUpdate: 4,
    rating: 2,
    areaType: AreaType.scope,
    areaDescription:
        'You will provide consistent, sufficient, and comprehensive test coverage.',
  ),
  Area(
    areaName: 'S3',
    numberOfUpdate: 5,
    rating: 1,
    areaType: AreaType.scope,
    areaDescription:
        'You will fix bugs and associated tests, backfilling coverage starting with a failing test for each of the bugs to be fixed.',
  ),
  Area(
    areaName: 'S4',
    numberOfUpdate: 8,
    rating: 3,
    areaType: AreaType.scope,
    areaDescription:
        'You will deliver stories successfully and consistently to move the team project along.',
  ),
  Area(
    areaName: 'S5',
    numberOfUpdate: 2,
    rating: 1,
    areaType: AreaType.scope,
    areaDescription:
        'You will actively participate in and contribute to team process including planning, standups, and retros.',
  ),
];

final List<Area> expertiseAreaList = [
  Area(
    areaName: 'E1',
    numberOfUpdate: 2,
    rating: 3,
    areaType: AreaType.expertise,
    areaDescription:
        'You will have a good understanding of computer science fundamentals: data structures, methodologies, and strategies.',
  ),
  Area(
    areaName: 'E2',
    numberOfUpdate: 4,
    rating: 2,
    areaType: AreaType.expertise,
    areaDescription:
        'You have practical knowledge in the specific programming language(s) and framework(s) used by your team.',
  ),
  Area(
    areaName: 'E3',
    numberOfUpdate: 5,
    rating: 1,
    areaType: AreaType.expertise,
    areaDescription:
        'You are capable of diagnosing problems, planning and applying fixes.',
  ),
  Area(
    areaName: 'E4',
    numberOfUpdate: 8,
    rating: 3,
    areaType: AreaType.expertise,
    areaDescription:
        'You are motivated to learn new technologies and techniques and demonstrate an ability to turn these learnings into new skills and experiences quickly.',
  ),
  Area(
    areaName: 'E5',
    numberOfUpdate: 2,
    rating: 1,
    areaType: AreaType.expertise,
    areaDescription:
        'You can communicate your understanding of a problem and your proposed solution.',
  ),
];

final List<Area> mindsetAreaList = [
  Area(
    areaName: 'M1',
    numberOfUpdate: 2,
    rating: 3,
    areaType: AreaType.mindset,
    areaDescription:
        'You are emotionally mature & humble. You care about being effective over being right. Ideally you’ve made major changes and decisions in your life and learned from the results.',
  ),
  Area(
    areaName: 'M2',
    numberOfUpdate: 4,
    rating: 2,
    areaType: AreaType.mindset,
    areaDescription:
        'You geek out about how cool software is, inhale articles and books on the subject, and enjoy trying out different languages, technologies, and methodologies.',
  ),
  Area(
    areaName: 'M3',
    numberOfUpdate: 5,
    rating: 1,
    areaType: AreaType.mindset,
    areaDescription:
        'Your focus is primarily at the syntax level, focused on code clarity and readability.',
  ),
  Area(
    areaName: 'M4',
    numberOfUpdate: 8,
    rating: 3,
    areaType: AreaType.mindset,
    areaDescription:
        'You are becoming increasingly comfortable with the confidence that testing brings to your coding.',
  ),
  Area(
      areaName: 'M5',
      numberOfUpdate: 2,
      rating: 1,
      areaType: AreaType.mindset,
      areaDescription:
          'You ask for reviews of the code you\'re writing and feedback on the work you’re doing.'),
];

final List<Goal> goalList = [
  Goal(
    goalId: '1',
    goalDescription: 'Marriage and Family Harmony',
    areaName: 'S1',
    createdTime: DateTime(2021, 10, 21),
    achieved: false,
    isPrioritized: false,
  ),
  Goal(
    goalId: '2',
    goalDescription: 'Proper Mindset and Balance',
    areaName: 'S1',
    createdTime: DateTime(2021, 10, 19),
    achieved: false,
    isPrioritized: true,
  ),
  Goal(
    goalId: '3',
    goalDescription: 'Commitment to Improved Physical Health',
    areaName: 'S1',
    createdTime: DateTime(2021, 05, 02),
    achieved: true,
    isPrioritized: true,
  ),
  Goal(
    goalId: '4',
    goalDescription: 'Career Passion and Personal Satisfaction',
    areaName: 'S2',
    createdTime: DateTime(2021, 09, 21),
    achieved: true,
    isPrioritized: true,
  ),
  Goal(
    goalId: '5',
    goalDescription: 'Develop Empathy and Gentleness',
    areaName: 'S2',
    createdTime: DateTime(2021, 07, 20),
    achieved: true,
    isPrioritized: false,
  ),
  Goal(
    goalId: '6',
    goalDescription: 'Financial Stability',
    areaName: 'M1',
    createdTime: DateTime(2021, 09, 21),
    achieved: false,
    isPrioritized: true,
  ),
  Goal(
    goalId: '7',
    goalDescription: 'Service and Social Responsibility',
    areaName: 'M2',
    createdTime: DateTime(2021, 10, 21),
    achieved: true,
    isPrioritized: true,
  ),
  Goal(
    goalId: '8',
    goalDescription: 'Stress-Busting Leisure Time',
    areaName: 'E1',
    createdTime: DateTime(2021, 08, 21),
    achieved: false,
    isPrioritized: true,
  ),
];
