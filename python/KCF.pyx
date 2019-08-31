from cvt cimport *
from libcpp cimport bool

#cdef extern from "../src/kcftracker.hpp":
#	cdef cppclass KCFTracker:
#		KCFTracker(bool, bool, bool, bool)
#		void init(Rect, Mat)
#		Rect update(Mat)

cdef extern from "./ptrtracker.cpp":
	cdef cppclass PtrTracker:
		cppclass TrackerKCF:
			PtrTracker create()
		bool init(Mat, Rect)
		bool update(Mat, Rect)	

#cdef extern from "opencv2/tracking.hpp" namespace "cv":
#	cdef cppclass Tracker:
#		pass
#	cdef cppclass TrackerKCF:
#		@staticmethod
#		Tracker create()
		
cdef class kcftracker:
	cdef PtrTracker classptr
	
	def __cinit__():
		self.classptr = TrackerKCF.create()
		
	def init(self, ary, rectlist):
		return self.classptr.init(nparray2cvmat(ary), pylist2cvrect(rectlist))
		
	def update(self, ary, rectlist):
		rect = pylist2cvrect(rectlist)
		result = self.classptr.update(nparray2cvmat(ary), rect)
		return result, cvrect2pylist(rect)

