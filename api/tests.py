from django.test import TestCase, Client

# Create your tests here.

class VersionAPITestCase(TestCase):
    def setUp(self):
        self.client = Client()
    
    def test_version_endpoint(self):
        resp = self.client.get('/api/version')
        resp_content = resp.content.decode('utf-8')
        self.assertIn('version', resp_content)
        self.assertIn('stack', resp_content)