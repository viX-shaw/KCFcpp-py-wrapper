from cvt cimport *
from libcpp cimport bool

#cdef extern from "../src/kcftracker.hpp":
#	cdef cppclass KCFTracker:
#		KCFTracker(bool, bool, bool, bool)
#		void init(Rect, Mat)
#		Rect update(Mat)

cdef extern from "./ptrtracker.cpp":
	cdef cppclass PtrTracker:
		pass

cdef extern from "opencv2/tracking.hpp" namespace "cv":
	cdef cppclass Tracker:
		bool init(Mat, Rect)
		bool update(Mat, Rect)	
		
	cdef cppclass TrackerKCF:
		@staticmethod
		PtrTracker create()
		
cdef class kcftracker:
	cdef PtrTracker classptr
	
	def __cinit__(self, hog, fixed_window, multiscale, lab):
		self.classptr = TrackerKCF.create()
		
	def __dealloc__(self):
		del self.classptr
		
	def init(self, ary, rectlist):
		return self.classptr.init(nparray2cvmat(ary), pylist2cvrect(rectlist))
		
	def update(self, ary, rectlist):
		rect = pylist2cvrect(rectlist)
		result = self.classptr.update(nparray2cvmat(ary), pylist2cvrect(rectlist))
		return result, cvrect2pylist(rect)

