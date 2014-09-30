from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.contrib.auth.models import User
from rest_framework import serializers, viewsets, routers, views, reverse, response
from rest_framework.views import APIView
from rest_framework.decorators import api_view
from rest_framework.response import Response

class HelloApiView(APIView):
    def get(self, request, format=None):
        return {"hello": "world"}

# Serializers define the API representation.
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'is_staff')


# ViewSets define the view behavior.
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer


# Routers provide a way of automatically determining the URL conf.
router = routers.DefaultRouter()

router.register(r'users', UserViewSet)

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^api/v1.0/hello[/]?$', HelloApiView.as_view(), name='my_hello_view'),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]
