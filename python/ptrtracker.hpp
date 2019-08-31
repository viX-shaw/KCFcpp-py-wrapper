#include <opencv2/core/cvstd.hpp>
#include <opencv2/core/utility.hpp>
#include <opencv2/tracking.hpp>


// typedef Ptr<Tracker> PtrTracker;

class KCFT
{
public:
    KCFT();
    ~KCFT();
    virtual bool init(cv::Mat img, cv::Rect box);
    virtual bool update(cv::Mat img, cv::Rect box);

    cv::Ptr<cv::Tracker> tracker;

};
