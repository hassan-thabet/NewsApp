abstract class NewsFeedStates {}

class NewsFeedInitialState extends NewsFeedStates {}
class NewsFeedTabChangeState extends NewsFeedStates {}

class NewsFeedLoadingState extends NewsFeedStates {}
class NewsFeedSuccessState extends NewsFeedStates {}
class NewsFeedOnErrorState extends NewsFeedStates {}

