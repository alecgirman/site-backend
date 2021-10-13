from django.test import TestCase, Client

# Create your tests here.

class BaseTestCase(TestCase):
    def setUp(self):
        self.client = Client()
        
    def test_index_returns_200(self):
        resp = self.client.get('')
        self.assertEqual(resp.status_code, 200)