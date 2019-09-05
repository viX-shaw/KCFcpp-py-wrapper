#include <opencv2/core/cvstd.hpp>
#include <opencv2/core/utility.hpp>
#include <opencv2/tracking.hpp>


// typedef Ptr<Tracker> PtrTracker;

class KCFT
{
public:
    KCFT();
    virtual ~KCFT();
    virtual bool init(cv::Mat img,const cv::Rect2d& box);
    virtual bool update(cv::Mat img, cv::Rect2d& box);

    cv::Ptr<cv::Tracker> tracker;

};
