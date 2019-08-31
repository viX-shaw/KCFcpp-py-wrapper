#include "ptrtracker.hpp"

KCFT::KCFT()
{
  tracker = cv::TrackerKCF::create();
}

KCFT::~KCFT()
{
  tracker = NULL;
}

bool KCFT::init(cv::Mat img, cv::Rect box)
{
  return tracker->init(img, box);
}

bool KCFT::update(cv::Mat img, cv::Rect box)
{
  const cv::Rect& b = box;
  return tracker->update(img, b);
}