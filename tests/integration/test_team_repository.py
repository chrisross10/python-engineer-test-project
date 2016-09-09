import unittest
import teams.team_repository as team_repo
import tests.integration.db_helper as db_helper

class TeamRepositoryTests(unittest.TestCase):
    def setUp(self):
        db_helper.clear_all_tables()

    def test_saves_a_new_team(self):
        test_team = TEAMS['team']
        team_repo.save(test_team, db_helper.ENGINE)

        db_teams = db_helper.get_records('teams')
        self.assertEqual(len(db_teams), 1)

        db_team = dict(db_teams[0].items())
        self.assertEqual(db_team['id'], test_team['id'])
        self.assertEqual(db_team['name'], test_team['name'])

TEAMS = {
    'id': 0,
    'name': 'dev-team'
}

