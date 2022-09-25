<?php

namespace App\Services;

class YouTubeAnalyticsService
{
    public \Google_Service_YouTubeAnalytics $youtubeAnalytics;

    public function __construct()
    {
        $client = new \Google_Client();
        $client->setAccessToken(config('youtube.token'));
        $this->youtubeAnalytics = new \Google_Service_YouTubeAnalytics($client);
    }

    public function getGroups(): \Google_Service_YouTubeAnalytics_ListGroupsResponse
    {
        return $this->youtubeAnalytics->groups->listGroups();
    }

    public function query(array $query): \Google_Service_YouTubeAnalytics_QueryResponse
    {
        return $this->youtubeAnalytics->reports->query($query);
    }
}
