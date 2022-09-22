<?php

namespace App\Services;

class YouTubeService
{
    public \Google_Service_YouTubeReporting $youtubeReporting;

    public function __construct()
    {
        $client = new \Google_Client();
        $client->setAccessToken(config('youtube.token'));
        $this->youtubeReporting = new \Google_Service_YouTubeReporting($client);
    }

    public function getReportTypes(): \Google_Service_YouTubeReporting_ListReportTypesResponse
    {
        return $this->youtubeReporting->reportTypes->listReportTypes();
    }

    public function getJobs(): \Google_Service_YouTubeReporting_ListJobsResponse
    {
        return $this->youtubeReporting->jobs->listJobs();
    }

    public function setJob($reportTypeId, $jobName): \Google_Service_YouTubeReporting_Job
    {
        $reportingJob = new \Google_Service_YouTubeReporting_Job();
        $reportingJob->setReportTypeId($reportTypeId);
        $reportingJob->setName($jobName);

        return $this->youtubeReporting->jobs->create($reportingJob);
    }


}
