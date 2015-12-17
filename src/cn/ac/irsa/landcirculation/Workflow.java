package cn.ac.irsa.landcirculation;
public class Workflow {
	static void  setCurrentStatus(Apply currentApply,String currentStatutsCode,String rtnMsgCode)
	{
		//获取当前Apply的完整信息
		currentApply=ApplyDao.getApply(currentApply.getId());
		//设置当前所处环节
		System.out.println("\n\ncurrentStatutsCode.substring(2, 3):"+currentStatutsCode.substring(0, 4));
		currentApply.setStepdef(StepdefDao.getStepdefByStepCode(currentStatutsCode.substring(0, 4)));
		//设置当前状态
		currentApply.setStatusdef(StatusdefDao.getStatusdefByStatusCode(currentStatutsCode));
		// 设置当前返回值
		currentApply.setRtnmsgdef(RtnmsgdefDao.getRtnmsgdefByMsgCode(rtnMsgCode));
		//设置当前流程模板信息
		currentApply.setFlowdef(FlowdefDao.getFlowdefByFlowCode(currentStatutsCode.substring(0, 2)));
		//更新当前Apply信息
		ApplyDao.updateApply(currentApply);
	}
}
