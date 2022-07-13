package com.ldj.sample;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import org.springframework.stereotype.Service;

// TODO 필요 없는 코드
@ToString
@RequiredArgsConstructor
@Service
public class SampleService {

    private final SampleDAO sampleDAO;

}
