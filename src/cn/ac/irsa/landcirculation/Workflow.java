package cn.ac.irsa.landcirculation;
public class Workflow {
	static void  setCurrentStatus(Apply currentApply,String currentStatutsCode,String rtnMsgCode)
	{
		//��ȡ��ǰApply��������Ϣ
		currentApply=ApplyDao.getApply(currentApply.getId());
		//���õ�ǰ��������
		System.out.println("\n\ncurrentStatutsCode.substring(2, 3):"+currentStatutsCode.substring(0, 4));
		currentApply.setStepdef(StepdefDao.getStepdefByStepCode(currentStatutsCode.substring(0, 4)));
		//���õ�ǰ״̬
		currentApply.setStatusdef(StatusdefDao.getStatusdefByStatusCode(currentStatutsCode));
		// ���õ�ǰ����ֵ
		currentApply.setRtnmsgdef(RtnmsgdefDao.getRtnmsgdefByMsgCode(rtnMsgCode));
		//���õ�ǰ����ģ����Ϣ
		currentApply.setFlowdef(FlowdefDao.getFlowdefByFlowCode(currentStatutsCode.substring(0, 2)));
		//���µ�ǰApply��Ϣ
		ApplyDao.updateApply(currentApply);
	}
}
