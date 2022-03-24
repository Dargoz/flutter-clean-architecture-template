import 'dart:convert';

import 'package:flutter_clean_architecture_template/features/feedback_feature/data/datasources/gitlab/remote/responses/issue_response.dart';
import 'package:flutter_test/flutter_test.dart';


import '../../../../../../../testing_data/get_string.dart';

void main() {
  test("test issue response json parse", () {
    var jsonString = getString('issue_response.json');
    var json = jsonDecode(jsonString);
    var result = IssueResponse.fromJson(json);
    var expected = <String, dynamic>{
      "id": 101923821,
      "iid": 1,
      "project_id": 27745171,
      "title": "[BUG] LOGIN PAGE",
      "description": "new issue created",
      "state": "opened",
      "created_at": "2022-02-05T08:09:45.068Z",
      "updated_at": "2022-02-05T08:09:45.068Z",
      "labels": ["bug", "critical"],
      "assignees": [],
      "author": {
        "id": 6480423,
        "username": "dargoz",
        "name": "Davin Reinaldo Gozali",
        "state": "active",
        "avatar_url":
            "https://gitlab.com/uploads/-/system/user/avatar/6480423/avatar.png",
        "web_url": "https://gitlab.com/dargoz"
      },
      "type": "ISSUE",
      "user_notes_count": 0,
      "merge_requests_count": 0,
      "upvotes": 0,
      "downvotes": 0,
      "confidential": false,
      "issue_type": "issue",
      "web_url": "https://gitlab.com/dargoz/notes/-/issues/1",
      "time_stats": {
        "time_estimate": 0,
        "total_time_spent": 0,
      },
      "task_completion_status": {"count": 0, "completed_count": 0},
      "blocking_issues_count": 0,
      "has_tasks": false,
      "_links": {
        "self": "https://gitlab.com/api/v4/projects/27745171/issues/1",
        "notes": "https://gitlab.com/api/v4/projects/27745171/issues/1/notes",
        "award_emoji":
            "https://gitlab.com/api/v4/projects/27745171/issues/1/award_emoji",
        "project": "https://gitlab.com/api/v4/projects/27745171"
      },
      "references": {"short": "#1", "relative": "#1", "full": "dargoz/notes#1"},
      "subscribed": true,
    };
    expect(result.toJson(), expected);
  });
}
