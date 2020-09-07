// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Workplace Clone`
  String get appTitle {
    return Intl.message(
      'Workplace Clone',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change the way you work`
  String get initScreenPageTitle1 {
    return Intl.message(
      'Change the way you work',
      name: 'initScreenPageTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Connect your team with familiar tools, helping everyone turn ideas into action.`
  String get initScreenPageDetail1 {
    return Intl.message(
      'Connect your team with familiar tools, helping everyone turn ideas into action.',
      name: 'initScreenPageDetail1',
      desc: '',
      args: [],
    );
  }

  /// `Share with your team`
  String get initScreenPageTitle2 {
    return Intl.message(
      'Share with your team',
      name: 'initScreenPageTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Groups help you make decisions fast and keep your team on the same page.`
  String get initScreenPageDetail2 {
    return Intl.message(
      'Groups help you make decisions fast and keep your team on the same page.',
      name: 'initScreenPageDetail2',
      desc: '',
      args: [],
    );
  }

  /// `Keep up to data`
  String get initScreenPageTitle3 {
    return Intl.message(
      'Keep up to data',
      name: 'initScreenPageTitle3',
      desc: '',
      args: [],
    );
  }

  /// `News Feed shows you what's important across your business as it happens.`
  String get initScreenPageDetail3 {
    return Intl.message(
      'News Feed shows you what\'s important across your business as it happens.',
      name: 'initScreenPageDetail3',
      desc: '',
      args: [],
    );
  }

  /// `Message instantly`
  String get initScreenPageTitle4 {
    return Intl.message(
      'Message instantly',
      name: 'initScreenPageTitle4',
      desc: '',
      args: [],
    );
  }

  /// `With Workplace Chat you can reach any coworker with messaging, voice and video calling.`
  String get initScreenPageDetail4 {
    return Intl.message(
      'With Workplace Chat you can reach any coworker with messaging, voice and video calling.',
      name: 'initScreenPageDetail4',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get signUpButton {
    return Intl.message(
      'SIGN UP',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `LOG IN`
  String get logInButton {
    return Intl.message(
      'LOG IN',
      name: 'logInButton',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Business Email`
  String get enterEmail {
    return Intl.message(
      'Enter Your Business Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Your business email`
  String get enterEmailInput {
    return Intl.message(
      'Your business email',
      name: 'enterEmailInput',
      desc: '',
      args: [],
    );
  }

  /// `CONTINUE`
  String get continueButton {
    return Intl.message(
      'CONTINUE',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `Check Your Email Inbox`
  String get checkEmail {
    return Intl.message(
      'Check Your Email Inbox',
      name: 'checkEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your code to get started. We've sent it to`
  String get checkEmailDetail {
    return Intl.message(
      'Enter your code to get started. We\'ve sent it to',
      name: 'checkEmailDetail',
      desc: '',
      args: [],
    );
  }

  /// `Can't find the email`
  String get cantFindEmail {
    return Intl.message(
      'Can\'t find the email',
      name: 'cantFindEmail',
      desc: '',
      args: [],
    );
  }

  /// `RESEND THE EMAIL`
  String get resendEmail {
    return Intl.message(
      'RESEND THE EMAIL',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `USE A DIFFERENT EMAIL ADDRESS`
  String get useDifferentEmail {
    return Intl.message(
      'USE A DIFFERENT EMAIL ADDRESS',
      name: 'useDifferentEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Details`
  String get enterYourDetails {
    return Intl.message(
      'Enter Your Details',
      name: 'enterYourDetails',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get fullNameInput {
    return Intl.message(
      'Enter your full name',
      name: 'fullNameInput',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get passwordInput {
    return Intl.message(
      'Enter password',
      name: 'passwordInput',
      desc: '',
      args: [],
    );
  }

  /// `Create a strong password with at least 8 characters. Mix numbers with uppercase and lowercase letters.`
  String get passwordDetail {
    return Intl.message(
      'Create a strong password with at least 8 characters. Mix numbers with uppercase and lowercase letters.',
      name: 'passwordDetail',
      desc: '',
      args: [],
    );
  }

  /// `Organization name`
  String get organizationName {
    return Intl.message(
      'Organization name',
      name: 'organizationName',
      desc: '',
      args: [],
    );
  }

  /// `Enter organization name`
  String get organizationNameInput {
    return Intl.message(
      'Enter organization name',
      name: 'organizationNameInput',
      desc: '',
      args: [],
    );
  }

  /// `Organization size`
  String get organizationSize {
    return Intl.message(
      'Organization size',
      name: 'organizationSize',
      desc: '',
      args: [],
    );
  }

  /// `Number of people`
  String get organizationSizeInput {
    return Intl.message(
      'Number of people',
      name: 'organizationSizeInput',
      desc: '',
      args: [],
    );
  }

  /// `0 to 49`
  String get organizationSizeChoice1 {
    return Intl.message(
      '0 to 49',
      name: 'organizationSizeChoice1',
      desc: '',
      args: [],
    );
  }

  /// `50 to 99`
  String get organizationSizeChoice2 {
    return Intl.message(
      '50 to 99',
      name: 'organizationSizeChoice2',
      desc: '',
      args: [],
    );
  }

  /// `100 to 499`
  String get organizationSizeChoice3 {
    return Intl.message(
      '100 to 499',
      name: 'organizationSizeChoice3',
      desc: '',
      args: [],
    );
  }

  /// `500 to 4,999`
  String get organizationSizeChoice4 {
    return Intl.message(
      '500 to 4,999',
      name: 'organizationSizeChoice4',
      desc: '',
      args: [],
    );
  }

  /// `5,000+`
  String get organizationSizeChoice5 {
    return Intl.message(
      '5,000+',
      name: 'organizationSizeChoice5',
      desc: '',
      args: [],
    );
  }

  /// `Enter the number of people in your entire company or organization.`
  String get organizationSizeDetail {
    return Intl.message(
      'Enter the number of people in your entire company or organization.',
      name: 'organizationSizeDetail',
      desc: '',
      args: [],
    );
  }

  /// `Job title`
  String get jobTitle {
    return Intl.message(
      'Job title',
      name: 'jobTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose a job title`
  String get jobTitleInput {
    return Intl.message(
      'Choose a job title',
      name: 'jobTitleInput',
      desc: '',
      args: [],
    );
  }

  /// `C - Level`
  String get jobTitleChoice1 {
    return Intl.message(
      'C - Level',
      name: 'jobTitleChoice1',
      desc: '',
      args: [],
    );
  }

  /// `SVP / VP`
  String get jobTitleChoice2 {
    return Intl.message(
      'SVP / VP',
      name: 'jobTitleChoice2',
      desc: '',
      args: [],
    );
  }

  /// `Director`
  String get jobTitleChoice3 {
    return Intl.message(
      'Director',
      name: 'jobTitleChoice3',
      desc: '',
      args: [],
    );
  }

  /// `Manager`
  String get jobTitleChoice4 {
    return Intl.message(
      'Manager',
      name: 'jobTitleChoice4',
      desc: '',
      args: [],
    );
  }

  /// `Staff`
  String get jobTitleChoice5 {
    return Intl.message(
      'Staff',
      name: 'jobTitleChoice5',
      desc: '',
      args: [],
    );
  }

  /// `Student / Intern`
  String get jobTitleChoice6 {
    return Intl.message(
      'Student / Intern',
      name: 'jobTitleChoice6',
      desc: '',
      args: [],
    );
  }

  /// `By creating your account, you agree to the Workplace Agreement on behalf of your organization and confirm that you have the authority to do so. And you agree to the Workplace Privacy, Acceptable Use and Cookies policies.`
  String get createAccountDetail {
    return Intl.message(
      'By creating your account, you agree to the Workplace Agreement on behalf of your organization and confirm that you have the authority to do so. And you agree to the Workplace Privacy, Acceptable Use and Cookies policies.',
      name: 'createAccountDetail',
      desc: '',
      args: [],
    );
  }

  /// `Creating account...`
  String get createAccountProgressing {
    return Intl.message(
      'Creating account...',
      name: 'createAccountProgressing',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipButton {
    return Intl.message(
      'Skip',
      name: 'skipButton',
      desc: '',
      args: [],
    );
  }

  /// `Create Groups Inside `
  String get createGroupsInside {
    return Intl.message(
      'Create Groups Inside ',
      name: 'createGroupsInside',
      desc: '',
      args: [],
    );
  }

  /// `Groups are spaces within your Workplace where people can post ideas, share files and much more. Here are some suggestions.`
  String get createGroupsInsideDetail {
    return Intl.message(
      'Groups are spaces within your Workplace where people can post ideas, share files and much more. Here are some suggestions.',
      name: 'createGroupsInsideDetail',
      desc: '',
      args: [],
    );
  }

  /// `Company Announcements`
  String get createGroupsInsideChoice1 {
    return Intl.message(
      'Company Announcements',
      name: 'createGroupsInsideChoice1',
      desc: '',
      args: [],
    );
  }

  /// `Marketing team`
  String get createGroupsInsideChoice2 {
    return Intl.message(
      'Marketing team',
      name: 'createGroupsInsideChoice2',
      desc: '',
      args: [],
    );
  }

  /// `Company Social`
  String get createGroupsInsideChoice3 {
    return Intl.message(
      'Company Social',
      name: 'createGroupsInsideChoice3',
      desc: '',
      args: [],
    );
  }

  /// `Project Updates`
  String get createGroupsInsideChoice4 {
    return Intl.message(
      'Project Updates',
      name: 'createGroupsInsideChoice4',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get createGroupsInsideChoiceMain {
    return Intl.message(
      'General',
      name: 'createGroupsInsideChoiceMain',
      desc: '',
      args: [],
    );
  }

  /// `Created for you.`
  String get createGroupsInsideChoiceMainDetail {
    return Intl.message(
      'Created for you.',
      name: 'createGroupsInsideChoiceMainDetail',
      desc: '',
      args: [],
    );
  }

  /// `Create Groups`
  String get createGroupsButton {
    return Intl.message(
      'Create Groups',
      name: 'createGroupsButton',
      desc: '',
      args: [],
    );
  }

  /// `Invite People to Join `
  String get invitePeople {
    return Intl.message(
      'Invite People to Join ',
      name: 'invitePeople',
      desc: '',
      args: [],
    );
  }

  /// `It's best to add a few people you work with.`
  String get invitePeopleDetail1 {
    return Intl.message(
      'It\'s best to add a few people you work with.',
      name: 'invitePeopleDetail1',
      desc: '',
      args: [],
    );
  }

  /// `Enter someone's email`
  String get invitePeopleInput {
    return Intl.message(
      'Enter someone\'s email',
      name: 'invitePeopleInput',
      desc: '',
      args: [],
    );
  }

  /// `Inviting people outside a verified or whitelisted email domain will show them your email address.`
  String get invitePeopleDetail2 {
    return Intl.message(
      'Inviting people outside a verified or whitelisted email domain will show them your email address.',
      name: 'invitePeopleDetail2',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get doneButton {
    return Intl.message(
      'Done',
      name: 'doneButton',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get enterPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get enterPasswordInput {
    return Intl.message(
      'Password',
      name: 'enterPasswordInput',
      desc: '',
      args: [],
    );
  }

  /// `Logging in...`
  String get loggingInProgressing {
    return Intl.message(
      'Logging in...',
      name: 'loggingInProgressing',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failed.`
  String get signInFailed {
    return Intl.message(
      'Sign in failed.',
      name: 'signInFailed',
      desc: '',
      args: [],
    );
  }

  /// `Create a post...`
  String get createPostInput {
    return Intl.message(
      'Create a post...',
      name: 'createPostInput',
      desc: '',
      args: [],
    );
  }

  /// `Post to a group`
  String get postToGroup {
    return Intl.message(
      'Post to a group',
      name: 'postToGroup',
      desc: '',
      args: [],
    );
  }

  /// `Search Group`
  String get searchGroupsInput {
    return Intl.message(
      'Search Group',
      name: 'searchGroupsInput',
      desc: '',
      args: [],
    );
  }

  /// `YOUR TOP GROUPS`
  String get yourTopGroups {
    return Intl.message(
      'YOUR TOP GROUPS',
      name: 'yourTopGroups',
      desc: '',
      args: [],
    );
  }

  /// `Open Group`
  String get openGroup {
    return Intl.message(
      'Open Group',
      name: 'openGroup',
      desc: '',
      args: [],
    );
  }

  /// `member`
  String get member {
    return Intl.message(
      'member',
      name: 'member',
      desc: '',
      args: [],
    );
  }

  /// `YOUR TIMELINE`
  String get yourTimeline {
    return Intl.message(
      'YOUR TIMELINE',
      name: 'yourTimeline',
      desc: '',
      args: [],
    );
  }

  /// `POST`
  String get postButton {
    return Intl.message(
      'POST',
      name: 'postButton',
      desc: '',
      args: [],
    );
  }

  /// `Members of `
  String get membersOf {
    return Intl.message(
      'Members of ',
      name: 'membersOf',
      desc: '',
      args: [],
    );
  }

  /// `Add to your post`
  String get addYourPost {
    return Intl.message(
      'Add to your post',
      name: 'addYourPost',
      desc: '',
      args: [],
    );
  }

  /// `What's on your mind?`
  String get whatYourMind {
    return Intl.message(
      'What\'s on your mind?',
      name: 'whatYourMind',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get photo {
    return Intl.message(
      'Photo',
      name: 'photo',
      desc: '',
      args: [],
    );
  }

  /// `Tag`
  String get tag {
    return Intl.message(
      'Tag',
      name: 'tag',
      desc: '',
      args: [],
    );
  }

  /// `Poll`
  String get poll {
    return Intl.message(
      'Poll',
      name: 'poll',
      desc: '',
      args: [],
    );
  }

  /// `Save post`
  String get savePost {
    return Intl.message(
      'Save post',
      name: 'savePost',
      desc: '',
      args: [],
    );
  }

  /// `Add this to your saved items`
  String get savePostDetail {
    return Intl.message(
      'Add this to your saved items',
      name: 'savePostDetail',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get seeMore {
    return Intl.message(
      'See More',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get like {
    return Intl.message(
      'Like',
      name: 'like',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Suggested group`
  String get suggestedGroup {
    return Intl.message(
      'Suggested group',
      name: 'suggestedGroup',
      desc: '',
      args: [],
    );
  }

  /// `Join`
  String get join {
    return Intl.message(
      'Join',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `Your Groups`
  String get yourGroups {
    return Intl.message(
      'Your Groups',
      name: 'yourGroups',
      desc: '',
      args: [],
    );
  }

  /// `Recently Visited`
  String get recentlyVisited {
    return Intl.message(
      'Recently Visited',
      name: 'recentlyVisited',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Top`
  String get top {
    return Intl.message(
      'Top',
      name: 'top',
      desc: '',
      args: [],
    );
  }

  /// `Latest Activity`
  String get latestActivity {
    return Intl.message(
      'Latest Activity',
      name: 'latestActivity',
      desc: '',
      args: [],
    );
  }

  /// `Create groups for teams`
  String get createGroups {
    return Intl.message(
      'Create groups for teams',
      name: 'createGroups',
      desc: '',
      args: [],
    );
  }

  /// `Workplace helps teams move faster by sharing ideas and updates through focused group discussion.`
  String get createGroupsDetail {
    return Intl.message(
      'Workplace helps teams move faster by sharing ideas and updates through focused group discussion.',
      name: 'createGroupsDetail',
      desc: '',
      args: [],
    );
  }

  /// `New group`
  String get newGroup {
    return Intl.message(
      'New group',
      name: 'newGroup',
      desc: '',
      args: [],
    );
  }

  /// `Start by picking members for your new group.`
  String get startNewGroup {
    return Intl.message(
      'Start by picking members for your new group.',
      name: 'startNewGroup',
      desc: '',
      args: [],
    );
  }

  /// `Type an email address`
  String get typeEmail {
    return Intl.message(
      'Type an email address',
      name: 'typeEmail',
      desc: '',
      args: [],
    );
  }

  /// `REVIEW`
  String get reviewButton {
    return Intl.message(
      'REVIEW',
      name: 'reviewButton',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `CREATE`
  String get createButton {
    return Intl.message(
      'CREATE',
      name: 'createButton',
      desc: '',
      args: [],
    );
  }

  /// `Group Name`
  String get groupName {
    return Intl.message(
      'Group Name',
      name: 'groupName',
      desc: '',
      args: [],
    );
  }

  /// `Ex. Finance Leads`
  String get groupNameInput {
    return Intl.message(
      'Ex. Finance Leads',
      name: 'groupNameInput',
      desc: '',
      args: [],
    );
  }

  /// `Group type and privacy`
  String get groupTypeAndPrivacy {
    return Intl.message(
      'Group type and privacy',
      name: 'groupTypeAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Group Settings`
  String get groupSettings {
    return Intl.message(
      'Group Settings',
      name: 'groupSettings',
      desc: '',
      args: [],
    );
  }

  /// `Group Type`
  String get groupType {
    return Intl.message(
      'Group Type',
      name: 'groupType',
      desc: '',
      args: [],
    );
  }

  /// `Teams & Projects`
  String get teamsAndProjects {
    return Intl.message(
      'Teams & Projects',
      name: 'teamsAndProjects',
      desc: '',
      args: [],
    );
  }

  /// `A space for smaller to work, with up to 250 members plus its own char`
  String get teamsAndProjectsDetail {
    return Intl.message(
      'A space for smaller to work, with up to 250 members plus its own char',
      name: 'teamsAndProjectsDetail',
      desc: '',
      args: [],
    );
  }

  /// `Discussions`
  String get discussions {
    return Intl.message(
      'Discussions',
      name: 'discussions',
      desc: '',
      args: [],
    );
  }

  /// `Start a conversation and get feedback from coworkers across your company`
  String get discussionsDetail {
    return Intl.message(
      'Start a conversation and get feedback from coworkers across your company',
      name: 'discussionsDetail',
      desc: '',
      args: [],
    );
  }

  /// `Announcements`
  String get announcements {
    return Intl.message(
      'Announcements',
      name: 'announcements',
      desc: '',
      args: [],
    );
  }

  /// `A place to broadcast your company news, updates and announcements`
  String get announcementsDetails {
    return Intl.message(
      'A place to broadcast your company news, updates and announcements',
      name: 'announcementsDetails',
      desc: '',
      args: [],
    );
  }

  /// `Social & More`
  String get socialAndMore {
    return Intl.message(
      'Social & More',
      name: 'socialAndMore',
      desc: '',
      args: [],
    );
  }

  /// `Plan lunch dates, sports and team outings`
  String get socialAndMoreDetail {
    return Intl.message(
      'Plan lunch dates, sports and team outings',
      name: 'socialAndMoreDetail',
      desc: '',
      args: [],
    );
  }

  /// `Multi-Company`
  String get multiCompany {
    return Intl.message(
      'Multi-Company',
      name: 'multiCompany',
      desc: '',
      args: [],
    );
  }

  /// `Work with people from other companies`
  String get multiCompanyDetail {
    return Intl.message(
      'Work with people from other companies',
      name: 'multiCompanyDetail',
      desc: '',
      args: [],
    );
  }

  /// `Visibility Settings`
  String get visibilitySettings {
    return Intl.message(
      'Visibility Settings',
      name: 'visibilitySettings',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Anyone can see the group, its members and their posts`
  String get openDetail {
    return Intl.message(
      'Anyone can see the group, its members and their posts',
      name: 'openDetail',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get closed {
    return Intl.message(
      'Close',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Anyone can find the group and see who's in it. Only members can see posts.`
  String get closedDetail {
    return Intl.message(
      'Anyone can find the group and see who\'s in it. Only members can see posts.',
      name: 'closedDetail',
      desc: '',
      args: [],
    );
  }

  /// `Secret`
  String get secret {
    return Intl.message(
      'Secret',
      name: 'secret',
      desc: '',
      args: [],
    );
  }

  /// `Only members can find the group, see who's in it and what they post.`
  String get secretDetail {
    return Intl.message(
      'Only members can find the group, see who\'s in it and what they post.',
      name: 'secretDetail',
      desc: '',
      args: [],
    );
  }

  /// `Description (optional)`
  String get description {
    return Intl.message(
      'Description (optional)',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Tell your members what your group is for, eg team planning, or organising a space mission.`
  String get descriptionInput {
    return Intl.message(
      'Tell your members what your group is for, eg team planning, or organising a space mission.',
      name: 'descriptionInput',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Enter a few words to search in Workplace.`
  String get enterSearch {
    return Intl.message(
      'Enter a few words to search in Workplace.',
      name: 'enterSearch',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message(
      'Menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `See your profile`
  String get seeProfile {
    return Intl.message(
      'See your profile',
      name: 'seeProfile',
      desc: '',
      args: [],
    );
  }

  /// `Add Cover Photo`
  String get addCover {
    return Intl.message(
      'Add Cover Photo',
      name: 'addCover',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Activity Log`
  String get activityLog {
    return Intl.message(
      'Activity Log',
      name: 'activityLog',
      desc: '',
      args: [],
    );
  }

  /// `See Your About Info`
  String get seeYourAboutInfo {
    return Intl.message(
      'See Your About Info',
      name: 'seeYourAboutInfo',
      desc: '',
      args: [],
    );
  }

  /// `Skills`
  String get skills {
    return Intl.message(
      'Skills',
      name: 'skills',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Org`
  String get org {
    return Intl.message(
      'Org',
      name: 'org',
      desc: '',
      args: [],
    );
  }

  /// `View Org Chart`
  String get viewOrgChart {
    return Intl.message(
      'View Org Chart',
      name: 'viewOrgChart',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message(
      'Posts',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `Live`
  String get live {
    return Intl.message(
      'Live',
      name: 'live',
      desc: '',
      args: [],
    );
  }

  /// `Add a post to your profile`
  String get addPost {
    return Intl.message(
      'Add a post to your profile',
      name: 'addPost',
      desc: '',
      args: [],
    );
  }

  /// `Posts on your profile will be visible here and to anyone who follows you. They're good for general updates about what you're up to.`
  String get addPostDetail {
    return Intl.message(
      'Posts on your profile will be visible here and to anyone who follows you. They\'re good for general updates about what you\'re up to.',
      name: 'addPostDetail',
      desc: '',
      args: [],
    );
  }

  /// `CREATE POST`
  String get createPostButton {
    return Intl.message(
      'CREATE POST',
      name: 'createPostButton',
      desc: '',
      args: [],
    );
  }

  /// `Groups`
  String get groups {
    return Intl.message(
      'Groups',
      name: 'groups',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message(
      'Saved',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Org Chart`
  String get orgChart {
    return Intl.message(
      'Org Chart',
      name: 'orgChart',
      desc: '',
      args: [],
    );
  }

  /// `Invite Coworkers`
  String get inviteCoworkers {
    return Intl.message(
      'Invite Coworkers',
      name: 'inviteCoworkers',
      desc: '',
      args: [],
    );
  }

  /// `Help & Settings`
  String get helpAndSettings {
    return Intl.message(
      'Help & Settings',
      name: 'helpAndSettings',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}