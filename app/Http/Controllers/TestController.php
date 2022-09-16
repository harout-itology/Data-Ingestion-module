<?php

namespace App\Http\Controllers;

use HaroutItology\AwsTimestream\TimestreamService;
use HaroutItology\AwsTimestream\TimestreamBuilder;
use HaroutItology\AwsTimestream\Dto\TimestreamReaderDto;


class TestController extends Controller
{
    public function index(TimestreamService $timestreamService)
    {
        $queryBuilder = TimestreamBuilder::query()
            ->select('*')
            ->from("data_ingestion_module", 'IoTMulti')
            ->whereAgo('time', '24h', '>=')
            ->orderBy('time', 'desc');

        $timestreamReader = TimestreamReaderDto::make($queryBuilder);

        // response from Aws timestream
        return $timestreamService->query($timestreamReader);
    }

}
