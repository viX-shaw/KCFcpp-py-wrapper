#include <opencv2/core/cvstd.hpp>
#include <opencv2/core/utility.hpp>
#include <opencv2/tracking.hpp>


// typedef Ptr<Tracker> PtrTracker;

class KCFT
{
public:
    KCFT();
    virtual ~KCFT();
    virtual bool init(cv::Mat img, const cv::Rect &box);
    virtual bool update(cv::Mat img, const cv::Rect &box);

    cv::Ptr<cv::Tracker> tracker;

};
